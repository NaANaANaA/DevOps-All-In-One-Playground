#!/usr/bin/env bash
set -euo pipefail

missing=()
for command in bash python3; do
  if ! command -v "$command" >/dev/null 2>&1; then
    missing+=("$command")
  fi
done

if [ "${#missing[@]}" -gt 0 ]; then
  printf 'Missing required commands: %s\n' "${missing[*]}" >&2
  exit 1
fi

python3 - <<'PY'
import importlib.util
import subprocess
import sys

if importlib.util.find_spec("yaml") is None:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "PyYAML"])
else:
    print("PyYAML already available")
PY

echo "Bootstrap complete. Install Docker, kubectl, Terraform, and Ansible separately if you plan to run every starter locally."
