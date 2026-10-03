# Optional integrations

Codex Context Optimizer works without third-party handoff or compression software.

The projects below are useful references or optional companions for users with advanced workflows. They are **not installed automatically**.

## Codex Compressor

Repository: https://github.com/hehee9/codex-compressor

Its focus is long-running Codex sessions that can enter a repeated read → compact → reread cycle.

It uses a cumulative handoff and Codex hooks so a new context window can resume from a compact state.

Why it is interesting:
- explicitly targets compaction loops;
- supports Windows, macOS and Linux;
- provides standalone/plugin installation;
- keeps handoff visible.

Why it is optional here:
- hook/plugin behavior is more invasive than our file-based default;
- it adds another moving part to the user's Codex environment;
- users should evaluate it separately for their Codex version.

## CatchUp

Repository: https://github.com/wilbeibi/catchup

CatchUp is a local-first session handoff tool supporting Codex and several other coding agents.

Why it is interesting:
- can resume/fork previous sessions;
- can transfer work between agents;
- supports trimmed/since-compaction handoffs;
- useful when moving between Codex, Claude Code, Cursor and other agents.

The optimizer's `doctor` command detects the `catchup` executable when it is already installed, but does not install it automatically.

## Project OS for Codex

Repository: https://github.com/herry2059/project-os-for-codex

This project treats project state, acceptance criteria, progress and handoffs as a durable control plane.

The relevant design lesson for this optimizer is that durable project truth should live outside a single chat.

## Codex Context Studio

Repository: https://github.com/HaShiShark/codex-context-studio

This project provides a visual/proxy-based context management layer, including usage views and context maintenance.

It is substantially more invasive than this optimizer because it proxies/rebuilds requests. It should therefore be evaluated separately rather than bundled into the default workflow.

## Design rule for this project

Borrow ideas, not hidden dependencies.

The default optimizer remains:
- file-based;
- inspectable;
- reversible;
- cross-platform;
- conservative about source code;
- independent of a proxy or modified Codex runtime.

Advanced users can layer external handoff/context tools on top when the benefits justify the extra complexity.
