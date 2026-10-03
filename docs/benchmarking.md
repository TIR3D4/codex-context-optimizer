# Benchmarking

The benchmark system exists to answer one question:

Does the optimized workflow reduce unnecessary Codex usage without reducing result quality?

## Use comparable tasks

A fair comparison needs tasks with similar complexity. Good pairs include two small bug fixes in the same subsystem, two API additions of similar scope, or repeated work on separate but structurally similar modules.

Do not compare a one-line documentation edit with a multi-module refactor.

## Capture a baseline

Run:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
~~~

Perform the baseline Codex task, then:

~~~bash
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
~~~

## Capture the optimized run

After the Atlas and AGENTS setup:

~~~bash
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
~~~

Perform a comparable task, then:

~~~bash
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
~~~

Compare the results:

~~~bash
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

## Metrics

The tool reports recorded input, cached input, non-cached input, output, total tokens, and unique responses when modern token usage records are available.

Cached input is a subset of input. It must not be added to input again.

Reasoning output is a subset of output and is shown separately for observability.

## Quality gate

Do not call a run better solely because it used fewer tokens.

For each comparison, verify:

- task requirements were satisfied;
- relevant tests passed;
- no regressions were introduced;
- no required files were skipped because of an overly strict context rule;
- the optimized run did not take shortcuts that reduce maintainability;
- both runs had comparable scope.

If token usage is lower but correctness is worse, the optimization failed.

## Important telemetry caveat

The local Codex session records are useful engineering telemetry, not an authoritative bill or subscription quota statement.

Codex versions may also evolve their session event schema. The parser prefers response-level token usage records and falls back conservatively when those are unavailable.
