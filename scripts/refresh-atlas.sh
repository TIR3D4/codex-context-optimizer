#!/usr/bin/env bash
set -euo pipefail

BUDGET="${ATLAS_BUDGET:-2048}"
OUT="${ATLAS_OUTPUT:-atlas-map.md}"

if ! command -v atlas >/dev/null 2>&1; then
  echo "Atlas is not installed. Run scripts/install-atlas.sh first." >&2
  exit 1
fi

if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
  echo "Run this inside a Git repository." >&2
  exit 1
fi

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

atlas . --for-agent --budget "$BUDGET" -o "$OUT"

echo "Updated $OUT with Atlas budget $BUDGET."
