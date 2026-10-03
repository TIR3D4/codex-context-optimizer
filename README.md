# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Measure first. Optimize context second. Preserve coding quality throughout.

Codex Context Optimizer is a lightweight toolkit for reducing unnecessary repository context in Codex without forcing the agent to work blind.

It combines:

- **Atlas** for a bounded repository map;
- **agents-md-generator** as a project-fact discovery source;
- concise, merge-safe **AGENTS.md** guidance;
- local **Codex usage telemetry** parsing;
- **before/after benchmarks**;
- compact **handoffs** for starting fresh threads safely.

## Design goal

The project does **not** try to minimize tokens at any cost.

The optimization target is:

> lower unnecessary context while preserving task correctness, tests, project rules, and access to additional source files whenever they are actually needed.

Atlas is treated as a navigation index, never as a replacement for source code.

## Quick start

Clone this toolkit and install the external helpers:

~~~bash
./setup.sh
~~~

Then open the repository you want to optimize in a fresh Codex chat and use:

~~~text
prompts/codex-one-shot-setup.md
~~~

The setup prompt preserves an existing AGENTS.md, previews generator output instead of blindly overwriting instructions, creates a bounded atlas-map.md, and verifies that application logic was not modified.

## Measure repository context

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
~~~

This reports tracked/source files, rough source-size context, AGENTS.md size, atlas-map.md size, large tracked source files, and obvious heavy directories.

The source-token number is only a rough size estimate. It is not API billing telemetry.

## Measure real Codex token telemetry

By default the tool reads local Codex session JSONL files under the Codex home directory:

~~~bash
python3 scripts/codex-context.py usage
~~~

It prefers per-response token_usage_record entries and deduplicates them by response ID. When those records are unavailable, it falls back to final cumulative token_count values per session.

Reported metrics can include:

- input tokens;
- cached input tokens;
- non-cached input tokens;
- cache-write input when available;
- output tokens;
- reasoning output tokens;
- total recorded tokens;
- peak last-turn input/context occupancy.

Local telemetry is useful for comparison, but it is **not** an authoritative invoice or subscription quota calculation.

## Before / after benchmark

Measure a normal run:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
# Run a representative Codex task
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
~~~

Then enable the optimized setup and run a comparable task:

~~~bash
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
# Run a comparable Codex task
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
~~~

Compare:

~~~bash
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

A reduction is considered useful only if correctness and validation quality are preserved. See [Benchmarking](docs/benchmarking.md).

## Fresh-thread handoff

Long sessions can accumulate large context. Create a compact handoff before moving to a new thread:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

This creates .codex-context/HANDOFF.md with a deliberately small structure for goal, decisions, changed files, validation and remaining work.

Do not use it as a dump of logs or diffs.

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
│   └── codex-one-shot-setup.md
├── templates/
│   └── AGENTS.md
├── scripts/
│   ├── codex-context.py
│   ├── install-atlas.sh
│   ├── install-agentsmd.sh
│   └── refresh-atlas.sh
└── docs/
    ├── methodology.md
    ├── benchmarking.md
    └── quality-guardrails.md
~~~

## Quality guardrails

The optimizer follows several safety rules:

- never force Codex to stay within an insufficient file set;
- allow progressive context expansion when evidence requires it;
- preserve existing project-specific AGENTS.md rules;
- do not ignore real source code just to shrink a map;
- prefer the narrowest relevant test first, but allow broader validation when risk warrants it;
- verify setup changes with git diff;
- never count token reduction as success if the result is less correct.

See [Quality guardrails](docs/quality-guardrails.md).

## Upstream projects

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- OpenAI Codex: https://github.com/openai/codex

They are independent upstream projects. This repository does not vendor or claim ownership of them.

## Normal Codex chats after setup

Once the repository is prepared, avoid repeating the long setup prompt. A normal request can usually be just the task itself.

If you want an explicit reminder:

~~~text
Use the project instructions and atlas-map.md for navigation.
Expand context whenever correctness requires it.

Task:
<your task>
~~~

## License

MIT
