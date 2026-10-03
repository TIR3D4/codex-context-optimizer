# Context pressure

Long Codex threads can gradually lose the token savings gained from better repository navigation.

The optimizer therefore tracks two different things:

1. **historical efficiency trend** — average recorded tokens per response before vs. after optimization;
2. **latest-session pressure** — how much of the reported model context window the latest session has occupied.

These are different signals.

## Pressure levels

The current thresholds are intentionally simple:

- NORMAL: below 65%
- ELEVATED: 65–79%
- HIGH: 80–89%
- CRITICAL: 90%+

A high value does not mean the model is broken. It means the current thread is carrying a large amount of context and a fresh thread may be more efficient.

## Recommended action

When `report` shows HIGH or CRITICAL pressure:

~~~powershell
python .codex-context\tools\codex-context.py fresh-start --repo .
~~~

The command creates:

~~~text
.codex-context/HANDOFF.md
~~~

Then open a new Codex chat in the same project and send:

~~~text
Read .codex-context/HANDOFF.md, AGENTS.md, and atlas-map.md if present.
Preserve the existing working tree, then continue with my task.
~~~

The handoff contains Git-based state and intentionally avoids copying full logs, full diffs, or the entire old conversation.

## Why not automatically kill or restart a session?

A tool should not interrupt active development solely because a threshold was crossed.

A large context may still be justified for:
- cross-module refactors;
- complex debugging;
- migrations;
- release work;
- tasks that genuinely require broad context.

The optimizer recommends a fresh start at a clean task boundary. The user or agent remains in control.

## Cached input

A high cached-input percentage is **not automatically bad**. Caching can reduce repeated compute/cost in systems that support it.

The more important signal for this project is whether average total/input tokens per response keep growing and whether the active thread is approaching its context window.

Do not treat cached ratio alone as a failure metric.
