# ChatGPT Work mode

Codex and ChatGPT Work have different execution environments, so they should not be treated as identical.

The shared optimization principle is:

> Use the minimum sufficient context, with unrestricted escalation when correctness requires more source material.

## Work context layout

For Work-oriented projects, use a small `.context/` layer:

~~~text
.context/
├── PROJECT_CONTEXT.md
├── CURRENT_TASK.md
├── DECISIONS.md
├── SOURCE_INDEX.md
└── HANDOFF.md
~~~

These files are navigation and handoff aids. They should remain compact.

### PROJECT_CONTEXT.md

Stable, project-wide information only:
- purpose;
- major architecture/components;
- stable constraints;
- where authoritative sources live.

Do not copy entire specifications into it.

### CURRENT_TASK.md

Only the current objective, scope, relevant sources, completed work and next step.

Update or replace it when the task changes.

### DECISIONS.md

Short durable decisions that would otherwise have to be rediscovered repeatedly.

Each decision should include:
- decision;
- reason;
- affected area;
- date when useful.

### SOURCE_INDEX.md

A routing table from topic to authoritative source.

Example:

~~~text
Payments -> docs/payments.md
API contracts -> api/openapi.yaml
Database schema -> db/schema.sql
Release process -> docs/release.md
~~~

The index should help Work retrieve the right source instead of opening many unrelated files.

## Existing Work chats

Do not assume an old Work conversation automatically discards its previous context because new project files were added.

For the cleanest transition:
1. create/update the context files;
2. create a compact handoff;
3. start a new Work chat for a new task boundary.

If continuity is required, explicitly tell the current chat to re-read `.context/PROJECT_CONTEXT.md`, `.context/CURRENT_TASK.md`, and `.context/SOURCE_INDEX.md`.

## Measuring Work efficiency

The Codex session JSONL token parser is Codex-specific and must not be presented as authoritative Work telemetry.

For Work, the current project measures controllable proxies:
- size of persistent context files;
- number of indexed sources;
- size of CURRENT_TASK.md;
- size of HANDOFF.md;
- repeated source references;
- whether project context has grown beyond configured warning thresholds.

This is intentionally conservative: the project does not invent token counts that it cannot observe.

## Quality protection

Work may read original sources whenever exact data matters.

Summaries and indexes are routing aids, not replacements for:
- contracts;
- spreadsheets;
- source code;
- policy documents;
- specifications;
- primary data.

When the summary and the original source disagree, use the original source.
