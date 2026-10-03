# Quality guardrails

Token reduction is secondary to correctness.

The optimizer should make repository navigation more efficient, not make Codex artificially blind.

## Progressive context, not a hard file cap

The intended behavior is:

1. begin with a compact repository map;
2. identify likely files;
3. inspect the smallest useful set;
4. expand to neighboring modules, tests, schemas, configs, or documentation when evidence requires it.

Never impose a rule such as "read at most five files."

## Source code remains authoritative

Atlas output is a navigation aid.

If implementation details, behavior, side effects, types, tests, generated contracts, or configuration matter, Codex must read the real source files.

## Existing project rules win

An existing AGENTS.md may contain deployment, safety, testing, formatting, or architecture constraints that an automatic generator cannot infer safely.

The setup process therefore previews generated guidance and merges it instead of force-overwriting existing instructions.

## Ignore conservatively

Large generated directories can be excluded from repository mapping when safe.

Do not exclude a source directory simply because it is large.

When a directory's role is unclear, preserve it.

## Narrow validation first, broader validation when risk requires it

Running a targeted test first saves time and context, but it is not a ban on full validation.

Broader test suites are appropriate for high-risk changes, shared libraries, schema changes, cross-module refactors, release preparation, or when a narrow test cannot provide sufficient confidence.

## Protect working state

Before setup or code changes:

- inspect git status;
- preserve unrelated modifications;
- avoid destructive reset/revert operations;
- inspect git diff before completion.

## Detect optimizer regressions

When benchmarking, compare both resource usage and quality.

A useful optimization should ideally reduce one or more of:

- input tokens;
- average tokens per model response;
- unnecessary files inspected;
- repeated repository scans;
- compaction pressure;
- repeated long-thread context.

while keeping correctness and validation at least equivalent.

## Escape hatch

If AGENTS.md or Atlas guidance appears to be hiding needed context, Codex should explicitly expand its search.

The optimizer should never prefer a smaller context over a correct answer.
