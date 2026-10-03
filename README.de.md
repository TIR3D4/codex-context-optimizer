# Codex Context Optimizer

[English](README.md) | [فارسی](README.fa.md) | **Deutsch** | [Español](README.es.md) | [Türkçe](README.tr.md)

Toolkit zur Reduzierung unnötigen Kontexts in **Codex** und für kompakte Projektkontexte in **ChatGPT Work**, ohne die Ergebnisqualität zu opfern.

## Grundregel

Nicht „so wenig Tokens wie möglich“, sondern:

> Mit dem kleinsten ausreichenden Kontext starten und ihn erweitern, sobald Korrektheit, Tests, Abhängigkeiten oder Unsicherheit es verlangen.

Atlas und Zusammenfassungen dienen der Navigation. Der Original-Quelltext bleibt maßgeblich.

## Codex

~~~bash
./setup.sh
~~~

Dann das Zielprojekt in einem neuen Codex-Chat öffnen und verwenden:

~~~text
prompts/codex-one-shot-setup.md
~~~

Vorhandene AGENTS.md-Dateien werden nicht blind überschrieben.

## Bestehende Chats

Alte Chats werden nicht als automatisch „neu geladen“ betrachtet.

Bevorzugt: nach dem Setup einen neuen Chat starten.

Falls ein alter Chat fortgesetzt werden muss:

~~~text
prompts/existing-chat-refresh.md
~~~

Für einen kompakten Übergang:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

## Messung

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
python3 scripts/codex-context.py usage
~~~

Vorher/Nachher:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

Weniger Tokens gelten nur dann als Verbesserung, wenn Korrektheit und Validierung erhalten bleiben.

## ChatGPT Work

~~~bash
python3 scripts/work-context.py init --repo /path/to/project
python3 scripts/work-context.py analyze --repo /path/to/project
~~~

Verwende anschließend:

~~~text
prompts/work-one-shot-setup.md
~~~

Work erhält einen kleinen .context-Bereich mit PROJECT_CONTEXT, CURRENT_TASK, DECISIONS und SOURCE_INDEX.

Mehr:
- [Methodik](docs/methodology.md)
- [Benchmarking](docs/benchmarking.md)
- [Qualitätsregeln](docs/quality-guardrails.md)
- [Bestehende Chats](docs/existing-chats.md)
- [Work-Modus](docs/work-mode.md)

## Lizenz

MIT
