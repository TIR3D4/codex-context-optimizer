# Codex Context Optimizer

**English** | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

Reduce unnecessary Codex context and token usage **without sacrificing result quality**.

## Use it in one step

Open your project in Codex and paste this:

~~~text
Install or update Codex Context Optimizer in the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Set it up automatically, preserve all existing project code and instructions, then continue with my task.

My task:
<WRITE YOUR TASK HERE>
~~~

That's it.

After installation, use Codex normally. You do **not** need to manually run reports, benchmarks, doctor checks, handoffs, or context commands.

The optimizer quietly handles:
- compact repository navigation;
- existing AGENTS.md preservation;
- Atlas setup when available;
- context-efficiency rules;
- usage trend tracking;
- context-pressure checks at sensible task boundaries;
- compact handoff preparation when a fresh chat would materially help.

If a new chat is recommended, Codex should tell you with one short instruction. Otherwise, the optimizer stays out of the way.

## Existing project or new project?

Same prompt.

The installer detects it automatically.

## Already have an old Codex chat?

After installation, you may continue it by sending once:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

For the best context efficiency, start a new chat at a clean task boundary when Codex recommends it.

## ChatGPT Work

The same installation also prepares a compact `.context/` layer for Work.

In Work, send:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

<details>
<summary><strong>Advanced / diagnostics</strong></summary>

Normal users do not need these commands.

~~~bash
python .codex-context/tools/codex-context.py report --repo .
python .codex-context/tools/codex-context.py doctor --repo .
python .codex-context/tools/codex-context.py fresh-start --repo .
python .codex-context/tools/codex-context.py analyze --repo .
~~~

Optional terminal installer:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

Documentation:
- [Automatic mode](prompts/AUTO_MODE.md)
- [Methodology](docs/methodology.md)
- [Quality guardrails](docs/quality-guardrails.md)
- [Context pressure](docs/context-pressure.md)
- [Existing chats](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [Optional integrations](docs/integrations.md)

</details>

## License

MIT
