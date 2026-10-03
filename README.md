# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Reduce unnecessary Codex context and token usage **without sacrificing result quality**.

## Quick start

Run this **inside your project folder**:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

That's it.

The installer automatically detects whether the project is **new** or **already existing**, and prepares the correct setup without overwriting your application code.

Then open the project in a **new Codex chat** and send:

~~~text
Follow .codex-context/SETUP.md, then continue with my task.
~~~

Now write your task normally.

Example:

~~~text
Follow .codex-context/SETUP.md, then continue with my task.

Add rate limiting to the login API.
~~~

## What it does

It automatically prepares a low-context workflow using:

- Atlas repository map
- compact AGENTS.md guidance
- safe handling of existing project instructions
- Codex usage measurement
- before/after benchmarks
- compact handoffs for long chats
- optional ChatGPT Work context files

The core rule is simple:

> Use the minimum sufficient context, and expand it whenever correctness requires more.

## Already have old Codex chats?

You can keep using them. Send this once in the old chat:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

For the cleanest and lowest-context result, a **new chat is still recommended** after installation.

## Using ChatGPT Work instead of Codex?

After the same install command, send this in Work:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

## Measure token usage

After installation:

~~~bash
python3 .codex-context/tools/codex-context.py usage
~~~

Analyze project context:

~~~bash
python3 .codex-context/tools/codex-context.py analyze --repo .
~~~

Benchmark before/after usage:

~~~bash
python3 .codex-context/tools/codex-context.py benchmark-start before --repo .
# run a representative Codex task
python3 .codex-context/tools/codex-context.py benchmark-end before --repo .
~~~

Then repeat with an `after` benchmark and compare:

~~~bash
python3 .codex-context/tools/codex-context.py benchmark-compare before after --repo .
~~~

Token reduction is only considered successful if correctness and validation quality are preserved.

<details>
<summary><strong>Advanced usage</strong></summary>

### Force new-project mode

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode new
~~~

### Force existing-project mode

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode existing
~~~

### Install into another directory

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --target /path/to/project
~~~

### Documentation

- [Methodology](docs/methodology.md)
- [Benchmarking](docs/benchmarking.md)
- [Quality guardrails](docs/quality-guardrails.md)
- [Existing chats](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)

### Upstream projects

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- OpenAI Codex: https://github.com/openai/codex

</details>

> Security note: if you do not want to pipe a remote script directly to Bash, inspect [install.sh](install.sh) first or clone the repository and run it locally.

## License

MIT
