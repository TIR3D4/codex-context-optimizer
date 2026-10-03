# Codex Context Optimizer

[English](README.md) | [فارسی](README.fa.md) | [Deutsch](README.de.md) | **Español** | [Türkçe](README.tr.md)

Kit para reducir contexto innecesario en **Codex** y mantener contexto compacto en **ChatGPT Work**, sin sacrificar la calidad del resultado.

## Regla principal

No buscamos “el mínimo número de tokens a cualquier precio”.

> Empezar con el contexto mínimo suficiente y ampliarlo cuando la corrección, las pruebas, las dependencias o la incertidumbre lo requieran.

Atlas y los resúmenes sirven para navegar; el código y las fuentes originales siguen siendo autoritativos.

## Codex

~~~bash
./setup.sh
~~~

Después abre el proyecto objetivo en un chat nuevo de Codex y usa:

~~~text
prompts/codex-one-shot-setup.md
~~~

## Chats existentes

No se supone que un chat antiguo reconstruya automáticamente su contexto al aparecer nuevos AGENTS.md o atlas-map.md.

Opción recomendada: iniciar un chat nuevo después del setup.

Para continuar un chat existente:

~~~text
prompts/existing-chat-refresh.md
~~~

Para un traspaso compacto:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

## Medición

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
python3 scripts/codex-context.py usage
~~~

Benchmark antes/después:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

Una reducción solo es éxito si se mantiene la corrección y la calidad de validación.

## ChatGPT Work

~~~bash
python3 scripts/work-context.py init --repo /path/to/project
python3 scripts/work-context.py analyze --repo /path/to/project
~~~

Luego usa:

~~~text
prompts/work-one-shot-setup.md
~~~

Más información:
- [Metodología](docs/methodology.md)
- [Benchmark](docs/benchmarking.md)
- [Protección de calidad](docs/quality-guardrails.md)
- [Chats existentes](docs/existing-chats.md)
- [Modo Work](docs/work-mode.md)

## Licencia

MIT
