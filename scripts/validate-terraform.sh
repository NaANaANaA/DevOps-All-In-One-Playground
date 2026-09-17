#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
if ! command -v terraform >/dev/null 2>&1; then
  echo "terraform not installed; skipping terraform fmt validation"
  exit 0
fi

terraform -chdir="$REPO_ROOT/templates/dhomane-devops-templates/terraform/modules/app-starter" fmt -check
