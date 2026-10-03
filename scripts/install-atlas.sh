#!/usr/bin/env bash
set -euo pipefail

if command -v atlas >/dev/null 2>&1; then
  echo "Atlas is already installed:"
  atlas --version
  exit 0
fi

if command -v pipx >/dev/null 2>&1; then
  pipx install --pre atlas-map
  atlas --version
  exit 0
fi

cat >&2 <<'EOF'
Atlas is not installed and pipx was not found.

Recommended:
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath

Then rerun this script.

No application dependencies were modified.
EOF
exit 1
