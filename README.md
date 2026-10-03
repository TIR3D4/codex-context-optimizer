# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Reduce unnecessary Codex context and token usage **without sacrificing result quality**.

## Easiest install — paste one prompt into Codex

Open your project in Codex and paste this:

~~~text
Install Codex Context Optimizer into the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Use prompts/install-and-run.md from that repository as the installation instructions.
Detect my OS and available tools, install it safely without overwriting application code, preserve any existing AGENTS.md, then follow the generated .codex-context/SETUP.md and continue with my task.
~~~

Then add your task under it.

Example:

~~~text
Install Codex Context Optimizer into the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Use prompts/install-and-run.md from that repository as the installation instructions.
Detect my OS and available tools, install it safely without overwriting application code, preserve any existing AGENTS.md, then follow the generated .codex-context/SETUP.md and continue with my task.

My task:
Fix the login API 500 error.
~~~

That's it. Codex handles Windows, macOS or Linux using the tools available in its environment.

## What happens automatically?

The installer workflow:
- detects whether the project is new or existing;
- preserves application code;
- preserves existing AGENTS.md/project instructions;
- prepares Atlas when available;
- creates compact context files;
- enables usage analysis, benchmarks and handoffs;
- keeps correctness more important than token reduction.

Core rule:

> Use the minimum sufficient context, then expand whenever correctness requires more.

## Already have old Codex chats?

For the cleanest result, open a new chat after installation.

If you want to continue an old chat, send:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

## ChatGPT Work

After installation, in Work send:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

## Optional command-line install

If you prefer the terminal, from the project root:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

This is optional. The prompt-first method above is recommended for simplicity and cross-platform use.

## Check whether it is actually helping

Use one command:

~~~bash
python .codex-context/tools/codex-context.py report --repo .
~~~

The report now shows:
- live before/after token trend;
- all post-optimizer responses, not a frozen benchmark;
- latest-session average usage;
- context-window pressure;
- saving drift since the previous report;
- a fresh-chat recommendation when pressure becomes HIGH or CRITICAL.

Example:

~~~text
Estimated saving:       22.9% per response
Context pressure:       HIGH
Since last report:      declined 7.1 percentage points

Recommended action:
python .codex-context\tools\codex-context.py fresh-start --repo .
~~~

Run a health check at any time:

~~~bash
python .codex-context/tools/codex-context.py doctor --repo .
~~~

When a long thread becomes heavy:

~~~bash
python .codex-context/tools/codex-context.py fresh-start --repo .
~~~

It creates a compact Git-aware handoff and prints the exact prompt for the new Codex chat.

> A high cached-input percentage is not automatically a problem. The optimizer focuses on average tokens per response and active context-window pressure.

Analyze repository structure separately if needed:

~~~bash
python .codex-context/tools/codex-context.py analyze --repo .
~~~

## Documentation

- [Install-from-chat prompt](prompts/install-and-run.md)
- [Methodology](docs/methodology.md)
- [Benchmarking](docs/benchmarking.md)
- [Quality guardrails](docs/quality-guardrails.md)
- [Existing chats](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [Context pressure & fresh starts](docs/context-pressure.md)
- [Optional integrations](docs/integrations.md)

## License

MIT
