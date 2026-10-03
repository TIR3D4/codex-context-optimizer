# One-shot Codex low-token setup

Prepare this repository for long-term, low-token Codex usage.

This is a one-time setup task. Do not perform product feature work.

Use the actual upstream tools where practical:
- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator

## Hard constraints

- Do not modify application/business logic.
- Do not delete or revert unrelated user work.
- Do not blindly overwrite any existing `AGENTS.md`.
- Do not recursively scan the repository yourself before using the available repository-navigation tools.
- Keep persistent context concise.
- Prefer progressive context expansion: start small and read more only when evidence requires it.

## Phase 1 — lightweight inspection

Inspect only:
- `git status`
- top-level directory names
- existing root `AGENTS.md`
- existing `atlas-map.md`
- README
- primary project manifests/configuration files

Do not broadly open source files yet.

If important project-specific facts cannot be determined cheaply, ask me one batch of at most 5 concise questions. Ask only questions that would materially improve token efficiency, safety, architecture guidance, or build/test commands.

## Phase 2 — Atlas

Check:

```bash
atlas --version
```

If Atlas is unavailable, prefer:

```bash
pipx install --pre atlas-map
```

If `pipx` is unavailable, report the safest supported alternative before changing the environment.

Do not replace a working Atlas installation unnecessarily.

Generate or refresh the repository map from the real repository root:

```bash
atlas . --for-agent --budget 2048 -o atlas-map.md
```

Keep the map near a 2048-token budget unless there is a demonstrated reason to change it.

If the repository is too large, prefer supported exclusions or focused paths over dramatically increasing the budget.

Treat `atlas-map.md` as a navigation index, not authoritative source code.

## Phase 3 — agents-md-generator

Check for Node.js 18+ and npm.

Do not install the generator into the application's dependency tree.

Use a temporary/tooling location outside the application source tree. If the tool is not already available, obtain it from:

https://github.com/nguyenthedat123/agents-md-generator

Install its own dependencies and use its dry-run/preview mode for this repository.

Do not use an AI/API-backed generation mode.

Save the generated proposal temporarily. Do not overwrite the repository's existing `AGENTS.md`.

Use the generator output only as evidence for:
- package manager/ecosystem
- build commands
- test commands
- lint/format commands
- workspace/module structure
- CI conventions
- important top-level project facts

## Phase 4 — create or merge AGENTS.md

If a root `AGENTS.md` already exists:
- preserve useful project-specific instructions;
- merge only useful detected facts;
- remove obvious duplication only when safe;
- preserve unclear existing rules rather than guessing.

If it does not exist:
- create a concise root `AGENTS.md` based on verified repository facts.

Keep the root file short. It should contain only instructions useful across many tasks.

Include these principles where relevant:

### Context efficiency
- Use `atlas-map.md` first for repository orientation.
- Identify the smallest relevant source-file set before opening source files.
- Prefer symbol/path/exact-term searches over broad scans.
- Expand context only when required.
- Do not reread unchanged files without a reason.
- Use `git status` and `git diff` to understand existing work.
- Avoid logs, generated files, caches, dependencies, backups, build output, large datasets, and unrelated documentation unless required.

### Editing safety
- Preserve unrelated user changes.
- Never revert modifications you did not create unless explicitly requested.
- Make the smallest correct change.
- Do not refactor unrelated code during a focused task.

### Validation
- Run the narrowest relevant test/check first.
- Use verified project commands.
- Avoid expensive full-project tests/builds unless necessary or explicitly requested.

### Completion
Report concisely:
- files changed;
- validation performed;
- unresolved uncertainty, if any.

Do not duplicate a repository map or large documentation inside `AGENTS.md`.

## Phase 5 — nested AGENTS.md

Do not create one in every directory.

Create nested `AGENTS.md` files only when a major subtree genuinely has different:
- build/test commands;
- architecture constraints;
- coding conventions;
- operational rules.

The purpose is to keep the root persistent context smaller, not to create more instruction files.

## Phase 6 — exclusions

Respect existing ignore files and project conventions.

Exclude clearly irrelevant/context-heavy paths only when appropriate, such as:
- node_modules
- vendor
- .venv / venv
- dist / build
- coverage
- caches
- generated output
- logs
- temporary files
- backups

Do not exclude real source code merely to make the map smaller.

## Phase 7 — verification

Before finishing, verify:

1. `AGENTS.md` exists and is concise.
2. Useful existing instructions were preserved.
3. `atlas-map.md` was generated successfully.
4. Atlas runs successfully.
5. agents-md-generator actually analyzed this repository.
6. No application/business logic was changed.
7. `git diff` contains only intended setup/documentation changes.
8. Future normal tasks do not require rerunning agents-md-generator.

## Final report

Return a compact report containing:
- Atlas version and whether it was already present;
- agents-md-generator location/status;
- what the generator detected;
- whether an old `AGENTS.md` existed and what was preserved;
- `AGENTS.md` files created/changed;
- `atlas-map.md` status and budget;
- any exclusions added;
- files changed;
- any remaining source of unnecessary context.

Then give me one very short prompt for normal future Codex chats.

Stop after setup and verification.
