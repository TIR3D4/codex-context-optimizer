# Automatic Git Safety

Codex Context Optimizer uses Git as a safety layer when the project already has Git metadata.

It does **not** initialize Git automatically.

## Normal behavior

When a task may modify files and `.git` exists, Codex should use lightweight Git checks:

~~~text
git status --short
git diff --name-only
~~~

Use them to understand existing work without loading large diffs into context.

Rules:

- Never run `git reset --hard`, `git clean -fd`, or destructive checkout commands automatically.
- Never stash, discard, or overwrite unrelated user changes.
- Never commit unrelated files.
- Do not create commits unless the user asked for commits or the project workflow explicitly requires them.
- Prefer `git diff -- <relevant paths>` over loading the entire repository diff.
- Use Git history only when it materially helps the current task.

## Branches and worktrees

Branches/worktrees are useful when:
- two Codex chats need to modify the same repository in parallel;
- a risky experiment should be isolated;
- a large refactor should not disturb the user's current working tree.

They should **not** be created for every small task.

Before creating a worktree:
- confirm the repository is actually a Git repository;
- inspect current status;
- avoid moving or hiding uncommitted user work;
- choose a clearly named branch/worktree;
- keep the original working tree untouched.

A typical isolated setup is:

~~~bash
git worktree add ../project-task-name -b codex/task-name
~~~

The exact path and branch name should be chosen for the current environment.

## Projects without Git

If `.git` is absent:
- do not initialize Git automatically;
- do not claim Git safety is active;
- continue using filesystem/project safety rules;
- mention Git only if the user asks or if version control would materially help.

## Why this is conservative

Automatic branch creation sounds convenient, but changing the user's branch/worktree without need can be more disruptive than helpful.

The default therefore provides **automatic safety checks**, while branch/worktree isolation is used only when the task or parallel workflow benefits from it.
