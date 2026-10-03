# Methodology

The optimizer is based on a simple principle:

> Persistent instructions should be small, while repository discovery should be structured and on demand.

## 1. Separate persistent instructions from repository structure

`AGENTS.md` is persistent guidance. It should contain stable project rules, verified commands, and context-efficiency behavior.

It should not contain a large dump of the repository tree or extensive architecture documentation.

`atlas-map.md` serves a different purpose: fast repository orientation within a bounded context budget.

## 2. Progressive context expansion

A task should normally follow this order:

1. understand the requested change;
2. inspect `atlas-map.md`;
3. identify the likely module/symbols;
4. open the smallest relevant source-file set;
5. expand only when evidence requires it;
6. make the smallest correct change;
7. run narrow validation;
8. review `git diff`.

This does not guarantee a fixed percentage of token savings. Savings depend on repository size, task type, model behavior, and how much source code must actually be inspected.

## 3. Preserve existing instructions

Existing `AGENTS.md` files may contain important operational constraints that automated tooling cannot infer safely.

The setup process therefore:
- previews generated guidance;
- merges useful facts;
- preserves unclear existing rules;
- avoids force-overwriting instructions.

## 4. Use nested instructions selectively

Nested `AGENTS.md` files are useful when a large subtree has genuinely different commands or constraints.

Creating them for every directory is counterproductive: it increases maintenance and can increase persistent context.

## 5. Keep Atlas bounded

The default workflow uses a 2048-token Atlas budget.

For large repositories, improve exclusions or focus before increasing the budget.

A larger map is not automatically a better map.

## 6. Measure on real tasks

Use comparable real tasks before and after setup.

Track:
- approximate context/tokens;
- files inspected;
- search/command count;
- task correctness;
- validation quality.

A lower token count is useful only if correctness is preserved.
