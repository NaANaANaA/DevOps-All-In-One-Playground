#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
status=0
while IFS= read -r -d '' file; do
  echo "Checking $file"
  if ! bash -n "$file"; then
    status=1
  fi
done < <(find "$REPO_ROOT/scripts" -type f -name '*.sh' -print0)

exit "$status"
