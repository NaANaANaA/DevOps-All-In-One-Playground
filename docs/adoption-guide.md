# Adoption guide

## 1. Pick a starter

- `templates/alberto-realworld/observability/` for local monitoring demos
- `templates/citadel-production/kubernetes/app-starter/` for application delivery on Kubernetes
- `templates/dhomane-devops-templates/.github/workflows/` for GitHub Actions reuse
- `templates/dhomane-devops-templates/terraform/modules/app-starter/` for Terraform module scaffolding
- `templates/dhomane-devops-templates/ansible/` for validation and deployment automation

## 2. Copy into another repository

Examples:

```bash
cp -R templates/citadel-production/kubernetes/app-starter /path/to/your-repo/k8s/app
cp -R templates/dhomane-devops-templates/.github/workflows /path/to/your-repo/.github/
cp -R scripts /path/to/your-repo/scripts
cp -R templates/dhomane-devops-templates/terraform/modules/app-starter /path/to/your-repo/terraform/modules/app-starter
```

Keep `THIRD_PARTY_NOTICES.md` references or replicate the relevant attribution in the destination repository when you retain inspired content.

## 3. Customize placeholders

Update these values before first deployment:

- Image references such as `ghcr.io/example-org/example-app:stable`
- Kubernetes namespace `example-app`
- Ingress host `app.example.test`
- Terraform variables in `example.auto.tfvars`
- GitHub workflow environment names and registry image tags

## 4. Configure secrets safely

Do not commit secrets into the copied repository.

Typical GitHub Actions secrets and variables:

- `KUBE_CONFIG` or OIDC-based cloud credentials
- `REGISTRY_USERNAME` and `REGISTRY_PASSWORD` when not using `GITHUB_TOKEN`
- `DEPLOY_NAMESPACE` and `IMAGE_REPOSITORY` as environment variables or repository variables

For Kubernetes, inject secrets separately with Sealed Secrets, External Secrets, or your target platform's secret manager.

## 5. Validate locally

```bash
./scripts/validate-shell.sh
./scripts/validate-yaml.sh
./scripts/validate-terraform.sh
./scripts/validate-kubernetes.sh
kubectl kustomize templates/citadel-production/kubernetes/app-starter > /tmp/example-app-manifests.yaml
ansible-playbook -i templates/dhomane-devops-templates/ansible/inventory.ini \
  templates/dhomane-devops-templates/ansible/deploy-k8s.yml --syntax-check
```

For observability:

```bash
cd templates/alberto-realworld/observability
docker compose up -d
curl -fsSL http://localhost:9090/-/ready
curl -fsSL http://localhost:9100/metrics | head
```

## 6. Clean up

```bash
cd templates/alberto-realworld/observability
docker compose down -v
cd ../../..
kubectl delete -k templates/citadel-production/kubernetes/app-starter --ignore-not-found
```

If Terraform was used with the example local resource, remove generated files and run `terraform destroy` in the consumer repository.
