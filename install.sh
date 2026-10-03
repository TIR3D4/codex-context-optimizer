#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/TIR3D4/codex-context-optimizer.git"
MODE="auto"
TARGET="$(pwd)"
TOOL_HOME="$HOME/.local/share/codex-context-optimizer"

usage() {
  cat <<'EOF'
Codex Context Optimizer bootstrap

Usage:
  curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
  curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode new
  curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode existing
  curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --target /path/to/project

Modes:
  auto       Detect whether the target looks new or existing.
  new        Prepare a newly starting project.
  existing   Retrofit an existing project safely.
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --mode)
      MODE="$2"; shift 2 ;;
    --target)
      TARGET="$2"; shift 2 ;;
    -h|--help)
      usage; exit 0 ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 2 ;;
  esac
done

case "$MODE" in
  auto|new|existing) ;;
  *) echo "Invalid mode: $MODE" >&2; exit 2 ;;
esac

TARGET="$(cd "$TARGET" && pwd)"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required." >&2
  exit 1
fi

mkdir -p "$(dirname "$TOOL_HOME")"
if [ -d "$TOOL_HOME/.git" ]; then
  git -C "$TOOL_HOME" fetch --quiet origin main || true
  git -C "$TOOL_HOME" reset --hard origin/main >/dev/null 2>&1 || true
else
  git clone --depth 1 "$REPO_URL" "$TOOL_HOME"
fi

if [ "$MODE" = "auto" ]; then
  tracked=0
  commits=0
  if git -C "$TARGET" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    tracked="$(git -C "$TARGET" ls-files | wc -l | tr -d ' ')"
    commits="$(git -C "$TARGET" rev-list --count HEAD 2>/dev/null || echo 0)"
  fi
  if [ "$tracked" -gt 5 ] || [ "$commits" -gt 1 ]; then
    MODE="existing"
  else
    MODE="new"
  fi
fi

if ! git -C "$TARGET" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git -C "$TARGET" init >/dev/null
fi

mkdir -p "$TARGET/.codex-context"
printf '%s
' "$MODE" > "$TARGET/.codex-context/INSTALL_MODE"

mkdir -p "$TARGET/.codex-context/tools"
cp "$TOOL_HOME/scripts/codex-context.py" "$TARGET/.codex-context/tools/codex-context.py"
cp "$TOOL_HOME/scripts/work-context.py" "$TARGET/.codex-context/tools/work-context.py"

# Save a one-time historical baseline for simple future reports.
# Never overwrite an existing baseline.
if [ ! -e "$TARGET/.codex-context/install-baseline.json" ]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 "$TARGET/.codex-context/tools/codex-context.py" usage --json > "$TARGET/.codex-context/install-baseline.json" 2>/dev/null || rm -f "$TARGET/.codex-context/install-baseline.json"
  elif command -v python >/dev/null 2>&1; then
    python "$TARGET/.codex-context/tools/codex-context.py" usage --json > "$TARGET/.codex-context/install-baseline.json" 2>/dev/null || rm -f "$TARGET/.codex-context/install-baseline.json"
  fi
fi

# Public, self-contained prompts copied into the target project.
cp "$TOOL_HOME/prompts/existing-chat-refresh.md" "$TARGET/.codex-context/REFRESH_OLD_CHAT.md"
cp "$TOOL_HOME/prompts/work-one-shot-setup.md" "$TARGET/.codex-context/WORK_SETUP.md"

# New projects can safely start from the compact template.
# Existing projects keep their current AGENTS.md untouched until Codex performs a semantic merge.
if [ "$MODE" = "new" ] && [ ! -e "$TARGET/AGENTS.md" ]; then
  cp "$TOOL_HOME/templates/AGENTS.md" "$TARGET/AGENTS.md"
fi

# Seed Work context files without overwriting project-owned content.
mkdir -p "$TARGET/.context"
for f in PROJECT_CONTEXT.md CURRENT_TASK.md DECISIONS.md SOURCE_INDEX.md; do
  if [ ! -e "$TARGET/.context/$f" ]; then
    cp "$TOOL_HOME/templates/work/$f" "$TARGET/.context/$f"
  fi
done

# Atlas is optional at bootstrap time. Install only through pipx when available.
if ! command -v atlas >/dev/null 2>&1 && command -v pipx >/dev/null 2>&1; then
  pipx install --pre atlas-map >/dev/null 2>&1 || true
fi

if command -v atlas >/dev/null 2>&1; then
  (
    cd "$TARGET"
    atlas . --for-agent --budget 2048 -o atlas-map.md >/dev/null 2>&1 || true
  )
fi

if [ "$MODE" = "existing" ]; then
  cp "$TOOL_HOME/prompts/codex-one-shot-setup.md" "$TARGET/.codex-context/SETUP.md"
else
  cat > "$TARGET/.codex-context/SETUP.md" <<'EOF'
# New-project setup

This is a new project prepared with Codex Context Optimizer.

Before implementing substantial features:

1. Read the current AGENTS.md.
2. Keep AGENTS.md concise and project-wide.
3. If atlas-map.md exists, use it for navigation only.
4. As source files are added, refresh Atlas when repository structure changes.
5. Use the minimum sufficient context and expand whenever correctness requires it.
6. Keep .context/PROJECT_CONTEXT.md and .context/CURRENT_TASK.md compact if using ChatGPT Work.
7. Do not add large architecture dumps, logs, or generated content to persistent context.
8. Preserve result quality over token reduction.
9. When the project gains real structure, refresh atlas-map.md.
10. Never refuse to inspect additional source files when correctness requires them.

For this first task, ask at most 5 concise questions only if they materially affect architecture, constraints, or validation. Then proceed with the user's task.
EOF
fi

cat > "$TARGET/.codex-context/NEXT.txt" <<EOF
Mode detected: $MODE

CODEX — NEW CHAT
Send only:
Follow .codex-context/SETUP.md, then continue with my task.

CODEX — OLD CHAT
Send only:
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.

CHATGPT WORK
Send only:
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.

TOOLS
Analyze repository context:
python3 .codex-context/tools/codex-context.py analyze --repo "$TARGET"

Simple optimizer report:
python3 .codex-context/tools/codex-context.py report --repo "$TARGET"

Codex local usage:
python3 .codex-context/tools/codex-context.py usage

Work context size:
python3 .codex-context/tools/work-context.py analyze --repo "$TARGET"
EOF

echo
echo "Codex Context Optimizer installed."
echo "Target: $TARGET"
echo "Mode:   $MODE"
echo
echo "NEW Codex chat:"
echo "  Follow .codex-context/SETUP.md, then continue with my task."
echo
echo "OLD Codex chat:"
echo "  Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task."
echo
echo "ChatGPT Work:"
echo "  Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation."
echo
echo "Details:"
echo "  $TARGET/.codex-context/NEXT.txt"
