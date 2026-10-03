# Existing chats after optimization

When a repository gains a new `AGENTS.md`, `atlas-map.md`, or context files, do not assume an already-running chat has automatically rebuilt its working context around those files.

## Safest rule

For the cleanest and most predictable result, finish the current unit of work, create a compact handoff, and start a **new chat** after the optimizer setup.

New chats are the preferred path because they begin with the repository's current instructions and current files instead of carrying a large amount of older conversation context.

## If you must continue an old Codex chat

Send the short refresh prompt from:

`prompts/existing-chat-refresh.md`

The agent should then:
- re-read the current root `AGENTS.md`;
- inspect the current `atlas-map.md`;
- check `git status` and `git diff`;
- preserve its existing task state;
- continue with progressive context expansion.

Do not paste the full AGENTS.md or atlas-map.md into chat unless the environment cannot access the files. Refer to the files instead.

## Old chats are not "broken"

The optimizer does not invalidate previous chats. The issue is efficiency and freshness: an old thread may already contain a large context and earlier assumptions.

Use an old thread when continuity is more valuable than a fresh context. Use a new thread when the task boundary is clean or the old thread has become large.

## Recommended migration

1. Finish or pause the current task.
2. Generate/update `AGENTS.md` and `atlas-map.md`.
3. Create a compact handoff if needed:
   `python3 scripts/codex-context.py handoff --repo /path/to/project`
4. Start a new chat.
5. Continue from the handoff and current project files.

This preserves important state without dragging the full previous conversation into every future turn.
