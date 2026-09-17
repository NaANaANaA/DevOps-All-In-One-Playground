# Ansible starter

Use this playbook to validate local prerequisites and deploy Kubernetes manifests rendered with `kubectl kustomize`.

The default `manifests_dir` assumes you copied your manifests to `k8s/app` next to the `ansible/` directory. Override it when your target repository uses a different layout.

```bash
ansible-playbook -i inventory.ini deploy-k8s.yml -e manifests_dir=../k8s/app
```
