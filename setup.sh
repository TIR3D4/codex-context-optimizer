#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$ROOT/scripts/install-atlas.sh"
"$ROOT/scripts/install-agentsmd.sh"

cat <<'EOF'

Tooling setup completed.

Codex:
1. Open the target repository in a fresh Codex chat.
2. Use prompts/codex-one-shot-setup.md.
3. For an already-running chat, use prompts/existing-chat-refresh.md or create a compact handoff.

ChatGPT Work:
1. Run:
   python3 scripts/work-context.py init --repo /path/to/project
2. Use prompts/work-one-shot-setup.md.
3. Keep .context files compact and retrieve original sources on demand.

Measurement:
- Codex repository analysis:
  python3 scripts/codex-context.py analyze --repo /path/to/project
- Codex local usage telemetry:
  python3 scripts/codex-context.py usage
- Work persistent-context size:
  python3 scripts/work-context.py analyze --repo /path/to/project

Token reduction is only considered successful when result quality and validation are preserved.
EOF
