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
workflow_paths = sorted((root / ".github/workflows").glob("*.y*ml"))
workflow_paths += sorted((root / "templates/dhomane-devops-templates/.github/workflows").glob("*.y*ml"))
errors = []
for path in workflow_paths:
    with path.open("r", encoding="utf-8") as handle:
        data = yaml.safe_load(handle)
    if not isinstance(data, dict) or "jobs" not in data:
        errors.append(f"{path.relative_to(root)}: workflow must contain jobs")
        continue
    if path.name == "deploy-template.yml":
        trigger = data.get("on", data.get(True, {}))
        if "workflow_call" not in trigger:
            errors.append(f"{path.relative_to(root)}: reusable workflow must declare workflow_call")
    print(f"Validated workflow {path.relative_to(root)}")

if errors:
    print("Workflow validation failed:", file=sys.stderr)
    for error in errors:
        print(f"- {error}", file=sys.stderr)
    sys.exit(1)
PY
