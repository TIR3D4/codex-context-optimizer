#!/usr/bin/env bash
set -euo pipefail

TOOLS_HOME="${CODEX_CONTEXT_TOOLS_HOME:-$HOME/.local/share/codex-context-optimizer}"
TARGET="$TOOLS_HOME/agents-md-generator"
REPO_URL="https://github.com/nguyenthedat123/agents-md-generator.git"

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "Node.js and npm are required. Node.js 18+ is recommended." >&2
  exit 1
fi

mkdir -p "$TOOLS_HOME"

if [ -d "$TARGET/.git" ]; then
  echo "agents-md-generator already exists at: $TARGET"
else
  git clone "$REPO_URL" "$TARGET"
fi

cd "$TARGET"
npm install

cat <<EOF
Installed tooling copy at:
  $TARGET

Use the generator's documented dry-run/preview mode against your target repository.
Do not use a force/overwrite option on an existing AGENTS.md.
EOF
