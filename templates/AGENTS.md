# Repository Agent Instructions

## Project commands

Fill these with verified commands from this repository only:

- Setup: `<command>`
- Test: `<command>`
- Lint/format: `<command>`
- Build: `<command>`

## Context efficiency

- Use `atlas-map.md` first for repository orientation when present.
- Treat maps and summaries as indexes; source files remain authoritative.
- Identify the smallest relevant file set before opening source files.
- Prefer targeted symbol/path/exact-term searches over broad scans.
- Expand context whenever correctness requires it.
- Avoid rereading unchanged files without a clear reason.
- Use `git status` and `git diff` to understand existing work.
- Avoid logs, caches, dependencies, generated files, build output, backups, and unrelated large files unless required.

## Automatic optimizer mode

- Read `.codex-context/AUTO_MODE.md` when present.
- The user should not need to manually manage optimizer commands during normal work.
- At sensible task boundaries, quietly check optimizer health when useful.
- Do not run telemetry checks on every turn.
- If context pressure becomes high, finish the current safe unit of work, prepare a compact handoff, and recommend a fresh chat only when it would materially improve efficiency.
- Do not interrupt active work solely because a threshold was crossed.
- Do not display token statistics unless the user asks or action is needed.

## Editing safety

- Preserve unrelated user changes.
- Never revert changes you did not create unless explicitly requested.
- Make the smallest correct change.
- Do not refactor unrelated code during a focused task.

## Validation

- Run the narrowest relevant check first.
- Use verified repository commands.
- Run broader validation when risk requires it.

## Completion

Report only:
- files changed;
- validation performed;
- unresolved uncertainty or an actionable context warning, if any.
