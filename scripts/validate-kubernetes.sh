#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
if ! command -v kubectl >/dev/null 2>&1; then
  echo "kubectl not installed; skipping kubernetes render validation"
  exit 0
fi

kubectl kustomize "$REPO_ROOT/templates/citadel-production/kubernetes/app-starter" >/dev/null
