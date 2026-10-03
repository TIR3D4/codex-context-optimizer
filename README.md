# Codex Context Optimizer

A lightweight bootstrap workflow for preparing an existing repository for lower-context, lower-token Codex sessions.

This project combines:

- **Atlas** for a compact repository map.
- **AGENTS.md generation + pruning** for concise, repository-specific instructions.
- A one-shot Codex setup prompt that preserves existing project rules and avoids modifying application logic.

## Goal

Reduce unnecessary context loading so Codex can:

- orient itself from a compact repository map;
- open only the smallest relevant set of source files;
- prefer targeted searches over broad scans;
- avoid logs, caches, dependencies, build artifacts, and generated files unless needed;
- use narrow validation before expensive full-project tests.

## Upstream tools

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- Codex: https://github.com/openai/codex

These are independent upstream projects. This repository does not vendor or claim ownership of them.

## Quick start

Open the target repository in Codex and use:

`prompts/codex-one-shot-setup.md`

That prompt performs a one-time setup. Afterward, normal Codex sessions should usually contain only the task itself, or at most:

```text
Follow AGENTS.md and use atlas-map.md for navigation.

Task:
<your task>
```

## Repository structure

```text
codex-context-optimizer/
├── README.md
├── LICENSE
├── prompts/
│   └── codex-one-shot-setup.md
├── templates/
│   └── AGENTS.md
├── scripts/
│   ├── install-atlas.sh
│   ├── install-agentsmd.sh
│   └── refresh-atlas.sh
└── docs/
    └── methodology.md
```

## Safety principles

- Never overwrite an existing `AGENTS.md` blindly.
- Never modify application/business logic during setup.
- Preserve unrelated user changes.
- Keep persistent instructions compact.
- Treat `atlas-map.md` as a navigation aid, not authoritative source code.
- Prefer progressive context expansion.

## License

MIT
