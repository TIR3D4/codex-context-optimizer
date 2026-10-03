# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Measure first. Optimize context second. Preserve quality throughout.

Codex Context Optimizer helps reduce unnecessary context usage in **Codex** and provides a compact context workflow for **ChatGPT Work**.

It combines:

- **Atlas** for bounded repository navigation;
- **agents-md-generator** as a project-fact discovery source;
- concise, merge-safe **AGENTS.md** guidance;
- local **Codex token telemetry** parsing;
- **before/after benchmarks**;
- safe migration for **existing chats**;
- compact **handoffs** for fresh threads;
- a small **.context/** layer for Work.

## Core rule

The project does **not** minimize tokens at any cost.

> Use the minimum sufficient context, then expand whenever correctness, tests, dependencies, or uncertainty require more.

Atlas and summaries are navigation aids. Original source files remain authoritative.

## Codex setup

Install the external helpers:

~~~bash
./setup.sh
~~~

Open the target repository in a **new Codex chat** and use:

~~~text
prompts/codex-one-shot-setup.md
~~~

The setup:
- preserves an existing AGENTS.md;
- previews generator output instead of blindly overwriting instructions;
- creates a bounded atlas-map.md;
- avoids application/business-logic changes;
- verifies the resulting setup;
- explains how to migrate older chats safely.

## Existing Codex chats

New AGENTS.md or atlas-map.md files should not be assumed to retroactively rebuild the context of an already-running chat.

For the cleanest transition, use a new chat after setup.

If you must continue an old chat, use:

~~~text
prompts/existing-chat-refresh.md
~~~

For important ongoing work, create a compact handoff instead of copying the full old conversation:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

See [Existing chats](docs/existing-chats.md).

## Measure repository context

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
~~~

This reports tracked/source files, rough source-size context, AGENTS.md size, atlas-map.md size, large tracked source files, and obvious heavy directories.

The source-token figure is only a rough size estimate, not billing telemetry.

## Measure real Codex token telemetry

~~~bash
python3 scripts/codex-context.py usage
~~~

The tool reads local Codex session JSONL files, prefers response-level token usage records, and deduplicates them by response ID when possible.

It can report:
- input tokens;
- cached input tokens;
- non-cached input tokens;
- cache-write input when available;
- output tokens;
- reasoning output tokens;
- total recorded tokens;
- peak last-turn input/context occupancy.

Local telemetry is useful for engineering comparisons, but it is **not** an authoritative invoice or subscription quota calculation.

## Before / after benchmark

Baseline:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
# Run a representative Codex task
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
~~~

Optimized run:

~~~bash
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
# Run a comparable Codex task
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
~~~

Compare:

~~~bash
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

Lower token usage counts as an improvement only when correctness and validation quality are preserved.

See [Benchmarking](docs/benchmarking.md) and [Quality guardrails](docs/quality-guardrails.md).

## ChatGPT Work mode

Work uses a different context model than Codex, so the optimizer does not pretend Codex telemetry applies to Work.

Initialize compact Work context files:

~~~bash
python3 scripts/work-context.py init --repo /path/to/project
~~~

This creates, without overwriting existing files:

~~~text
.context/
├── PROJECT_CONTEXT.md
├── CURRENT_TASK.md
├── DECISIONS.md
└── SOURCE_INDEX.md
~~~

Then use:

~~~text
prompts/work-one-shot-setup.md
~~~

Check their approximate persistent size:

~~~bash
python3 scripts/work-context.py analyze --repo /path/to/project
~~~

For Work, these are context-size proxies, not claimed exact token billing.

See [Work mode](docs/work-mode.md).

## Repository structure

~~~text
codex-context-optimizer/
├── README.md
├── README.fa.md
├── README.de.md
├── README.es.md
├── README.tr.md
├── LICENSE
├── prompts/
│   ├── codex-one-shot-setup.md
│   ├── existing-chat-refresh.md
│   └── work-one-shot-setup.md
├── templates/
│   ├── AGENTS.md
│   └── work/
├── scripts/
│   ├── codex-context.py
│   ├── work-context.py
│   ├── install-atlas.sh
│   ├── install-agentsmd.sh
│   └── refresh-atlas.sh
└── docs/
    ├── methodology.md
    ├── benchmarking.md
    ├── quality-guardrails.md
    ├── existing-chats.md
    └── work-mode.md
~~~

## Upstream projects

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- OpenAI Codex: https://github.com/openai/codex

They are independent upstream projects.

## Normal chats after setup

For Codex, a normal task can usually be just the task itself. If you want an explicit reminder:

~~~text
Use the project instructions and atlas-map.md for navigation.
Expand context whenever correctness requires it.

Task:
<your task>
~~~

For Work, keep PROJECT_CONTEXT and CURRENT_TASK compact and use SOURCE_INDEX to reach authoritative sources on demand.

## License

MIT
