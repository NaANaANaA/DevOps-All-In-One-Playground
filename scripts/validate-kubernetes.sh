#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
if ! command -v kubectl >/dev/null 2>&1; then
  echo "kubectl not installed; skipping kubernetes render validation"
  exit 0
fi

rendered=$(kubectl kustomize "$REPO_ROOT/templates/citadel-production/kubernetes/app-starter")
if grep -Eq '^[[:space:]]*kind:[[:space:]]*Namespace[[:space:]]*$' <<<"$rendered"; then
  echo "kustomization must stay namespace-free because deployment helpers create the namespace separately" >&2
  exit 1
fi
printf '%s\n' "$rendered" >/dev/null
