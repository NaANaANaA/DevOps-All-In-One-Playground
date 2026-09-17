# DevOps All-In-One Playground

A practical DevOps playground and adoptable template library for day-to-day platform work. This repository is organized as a small set of reusable starters for local observability, Kubernetes delivery, GitHub Actions automation, Terraform scaffolding, and Ansible-driven deployment workflows.

## Provenance and attribution policy

This repository was populated as an original template library while using these upstream projects only as inspiration:

- [`vellankikoti/DevOps-All-In-One-Playground`](https://github.com/vellankikoti/DevOps-All-In-One-Playground) for high-level architecture only. Its repository does not declare a reusable source license, so this repository does **not** copy its source files verbatim.
- [`dhomane/DevOps-Templates`](https://github.com/dhomane/DevOps-Templates) and [`AlbertoBarrago/devops-realworld-templates`](https://github.com/AlbertoBarrago/devops-realworld-templates) for MIT-compatible patterns and folder inspiration.
- `Citadel-Cloud-Management/devops-templates-production` for manual review only. The `templates/citadel-production/` content in this repository is original material based on general production practices.

See [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md) for attribution details.

## Quick starts

### 1. Validate the repository locally

```bash
./scripts/bootstrap-tools.sh
./scripts/validate-shell.sh
./scripts/validate-yaml.sh
./scripts/validate-terraform.sh
./scripts/validate-kubernetes.sh
./scripts/validate-workflows.sh
```

### 2. Run the local observability starter

```bash
cd templates/alberto-realworld/observability
docker compose up -d
```

Then open:

- Grafana: <http://localhost:3000> (`admin` / `admin`)
- Prometheus: <http://localhost:9090>
- Node Exporter metrics: <http://localhost:9100/metrics>

Stop the stack with `docker compose down -v`.

### 3. Preview the Kubernetes starter

```bash
kubectl kustomize templates/citadel-production/kubernetes/app-starter > /tmp/example-app-manifests.yaml
```

### 4. Reuse the GitHub Actions starter

Copy the files from `templates/dhomane-devops-templates/.github/workflows/` into another repository's `.github/workflows/` directory, copy `scripts/` or replace the referenced validation commands, and adjust the inputs and image placeholders.

## Prerequisites

- Bash 4+
- Python 3 with `PyYAML` available for YAML validation
- Docker with Compose support for the observability starter
- `kubectl` for Kubernetes validation and deployment
- Terraform 1.5+ for the Terraform starter
- Ansible 2.14+ for the deployment playbook

## Repository layout

```text
.
├── .github/workflows/              # CI for validating this repository
├── docs/                           # Adoption and usage guidance
├── scripts/                        # Portable validation/bootstrap helpers
├── templates/
│   ├── alberto-realworld/          # MIT-inspired observability and sample app assets
│   ├── citadel-production/         # Original production-oriented Kubernetes starter
│   └── dhomane-devops-templates/   # MIT-inspired workflows, Terraform, and Ansible
├── LICENSE                         # MIT for original material in this repository
└── THIRD_PARTY_NOTICES.md          # Separate upstream attribution and provenance notes
```

## Included starters

- **Observability:** Docker Compose starter for Prometheus, Grafana, and Node Exporter
- **Kubernetes:** Namespace, ConfigMap, Deployment, Service, Ingress, HPA, PDB, NetworkPolicy, and health probes
- **GitHub Actions:** Validation CI and a reusable deployment workflow template with no embedded secrets
- **Terraform:** Provider-neutral starter module scaffold using safe placeholders and optional local output generation
- **Ansible:** Local prerequisite validation plus `kubectl apply -k` deployment helper

## Adoption flow

Use [`docs/adoption-guide.md`](./docs/adoption-guide.md) to copy a template into another repository, wire secrets and variables, validate locally, customize names/domains/images, and clean up resources.
