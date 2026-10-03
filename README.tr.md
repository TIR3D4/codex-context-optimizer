# Codex Context Optimizer

[English](README.md) | [فارسی](README.fa.md) | [Deutsch](README.de.md) | [Español](README.es.md) | **Türkçe**

**Codex** içinde gereksiz bağlam kullanımını azaltmak ve **ChatGPT Work** için kompakt proje bağlamı oluşturmak için araç seti.

## Ana ilke

Amaç her ne pahasına olursa olsun en az token kullanmak değildir.

> En küçük yeterli bağlamla başla; doğruluk, testler, bağımlılıklar veya belirsizlik gerektirdiğinde bağlamı genişlet.

Atlas ve özet dosyaları yön bulmak içindir. Asıl kaynak dosyalar her zaman otoritedir.

## Codex kurulumu

~~~bash
./setup.sh
~~~

Hedef projeyi yeni bir Codex sohbetinde aç ve şunu kullan:

~~~text
prompts/codex-one-shot-setup.md
~~~

## Eski sohbetler

Yeni AGENTS.md veya atlas-map.md dosyalarının eski bir sohbetin bağlamını otomatik olarak yeniden kurduğu varsayılmaz.

En temiz seçenek: setup sonrası yeni sohbet başlat.

Eski sohbeti sürdürmek gerekiyorsa:

~~~text
prompts/existing-chat-refresh.md
~~~

Kompakt devir için:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

## Ölçüm

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
python3 scripts/codex-context.py usage
~~~

Önce/sonra benchmark:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project
python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project
python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

Token azalması yalnızca doğruluk ve doğrulama kalitesi korunuyorsa başarıdır.

## ChatGPT Work

~~~bash
python3 scripts/work-context.py init --repo /path/to/project
python3 scripts/work-context.py analyze --repo /path/to/project
~~~

Ardından:

~~~text
prompts/work-one-shot-setup.md
~~~

Daha fazla:
- [Metodoloji](docs/methodology.md)
- [Benchmark](docs/benchmarking.md)
- [Kalite korumaları](docs/quality-guardrails.md)
- [Eski sohbetler](docs/existing-chats.md)
- [Work modu](docs/work-mode.md)

## Lisans

MIT
