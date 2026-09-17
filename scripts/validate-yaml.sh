#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
export REPO_ROOT
python3 - <<'PY'
from pathlib import Path
import os
import sys
import yaml

root = Path(os.environ["REPO_ROOT"])
errors = []
for path in sorted(root.rglob("*.yml")) + sorted(root.rglob("*.yaml")):
    if ".git/" in path.as_posix():
        continue
    try:
        with path.open("r", encoding="utf-8") as handle:
            list(yaml.safe_load_all(handle))
        print(f"Validated {path.relative_to(root)}")
    except Exception as exc:
        errors.append(f"{path.relative_to(root)}: {exc}")

if errors:
    print("YAML validation failed:", file=sys.stderr)
    for error in errors:
        print(f"- {error}", file=sys.stderr)
    sys.exit(1)
PY
