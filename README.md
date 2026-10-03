# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Reduce unnecessary Codex context and token usage **without sacrificing result quality**.

## Windows: one command

Open PowerShell in your project folder and run:

~~~powershell
irm https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.ps1 | iex
~~~

Done.

Open Codex in that project and write your task normally. No setup prompt is required for every new chat.

The installer downloads only the small runtime files it needs. It does **not** clone or ask Codex to read the whole optimizer repository, which keeps installation overhead and context use low.

## macOS / Linux

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

## What runs automatically?

After installation, Codex gets compact project guidance for:

- targeted repository navigation;
- Atlas use when already available;
- preserving existing project instructions;
- quiet context-pressure monitoring;
- compact handoffs when a fresh chat would materially help;
- automatic Git safety when the project already uses Git.

### Git safety

If the project has Git, Codex can use lightweight status/diff checks to protect existing work.

It will **not** automatically:
- initialize Git in a non-Git project;
- reset/clean/stash user changes;
- commit unrelated files;
- create branches/worktrees for every small task.

Worktrees are reserved for parallel or risky work where isolation is actually useful.

## Installing from inside Codex

If you prefer to ask Codex to install it, paste:

~~~text
Install or update Codex Context Optimizer in this project using:
https://github.com/TIR3D4/codex-context-optimizer/blob/main/prompts/install-and-run.md

Use the lightweight installer. Do not inspect the optimizer repository. Then continue with my task.
~~~

## Normal use

After installation, just write tasks:

~~~text
Fix the payment registration bug and verify the relevant flow.
~~~

You do not need to manually manage `report`, `doctor`, benchmarks, handoffs, or Git helper commands.

<details>
<summary><strong>Advanced / diagnostics</strong></summary>

~~~bash
python .codex-context/tools/codex-context.py report --repo .
python .codex-context/tools/codex-context.py doctor --repo .
python .codex-context/tools/codex-context.py fresh-start --repo .
python .codex-context/tools/codex-context.py analyze --repo .
~~~

Documentation:
- [Automatic mode](prompts/AUTO_MODE.md)
- [Git safety](docs/git-safety.md)
- [Methodology](docs/methodology.md)
- [Quality guardrails](docs/quality-guardrails.md)
- [Context pressure](docs/context-pressure.md)
- [Existing chats](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [Optional integrations](docs/integrations.md)

</details>

## License

MIT
