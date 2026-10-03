# Repository Agent Instructions

## Project commands

Fill these with verified commands from this repository only:

- Setup: `<command>`
- Test: `<command>`
- Lint/format: `<command>`
- Build: `<command>`

## Context efficiency

- Use `atlas-map.md` first for repository orientation.
- Treat the map as an index; source files remain authoritative.
- Identify the smallest relevant file set before opening source files.
- Prefer targeted symbol/path/exact-term searches over broad scans.
- Expand context only when required.
- Avoid rereading unchanged files without a clear reason.
- Use `git status` and `git diff` to understand existing work.
- Avoid logs, caches, dependencies, generated files, build output, backups, and unrelated large files unless required.

## Editing safety

- Preserve unrelated user changes.
- Never revert changes you did not create unless explicitly requested.
- Make the smallest correct change.
- Do not refactor unrelated code during a focused task.

## Validation

- Run the narrowest relevant check first.
- Use verified repository commands.
- Run expensive full-project validation only when necessary.

## Completion

Report:
- files changed;
- validation performed;
- unresolved uncertainty, if any.
