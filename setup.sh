#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$ROOT/scripts/install-atlas.sh"
"$ROOT/scripts/install-agentsmd.sh"

cat <<'EOF'

Tooling setup completed.

Next:
1. Open your target repository in Codex.
2. Paste prompts/codex-one-shot-setup.md into a fresh chat.
3. Let Codex prepare that repository without modifying application logic.
EOF
