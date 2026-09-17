# citadel-production

This section intentionally avoids copying files from `Citadel-Cloud-Management/devops-templates-production`. Use the upstream repository for manual comparison, but treat the manifests in this folder as original, production-oriented starter templates created for this repository.


The Kubernetes starter keeps ingress limited to same-namespace pods and allows only DNS plus common HTTP/HTTPS egress by default. Tighten `networkpolicy.yaml` to your destination CIDRs or service namespaces before production use.
