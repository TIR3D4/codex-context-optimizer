# Codex Context Optimizer

[English](README.md) | **فارسی** | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

ابزاری برای کاهش مصرف بی‌دلیل context و توکن در **Codex** و ساخت یک لایه context سبک برای **ChatGPT Work**، بدون قربانی‌کردن کیفیت نتیجه.

## اصل اصلی

هدف این پروژه «کمترین توکن به هر قیمت» نیست.

> ابتدا با حداقل context کافی شروع کن و هر زمان صحت، تست، وابستگی یا ابهام نیاز داشت، context را گسترش بده.

Atlas و فایل‌های خلاصه فقط برای مسیریابی هستند؛ source اصلی همچنان مرجع نهایی است.

## راه‌اندازی Codex

~~~bash
./setup.sh
~~~

بعد پروژه هدف را در یک **چت جدید Codex** باز کن و از این فایل استفاده کن:

~~~text
prompts/codex-one-shot-setup.md
~~~

Setup:
- AGENTS.md موجود را کورکورانه overwrite نمی‌کند؛
- خروجی agents-md-generator را ابتدا preview می‌کند؛
- atlas-map.md با بودجه محدود می‌سازد؛
- کد اصلی برنامه را تغییر نمی‌دهد؛
- در پایان وضعیت را validate می‌کند.

## چت‌های قدیمی

اگر پروژه قبل از optimizer چند چت داشته باشد، فرض نمی‌کنیم چت‌های قدیمی خودکار context جدید را از نو بارگذاری کنند.

بهترین حالت: بعد از setup یک چت جدید باز کن.

اگر باید همان چت قدیمی ادامه پیدا کند:

~~~text
prompts/existing-chat-refresh.md
~~~

برای انتقال کار مهم به چت جدید:

~~~bash
python3 scripts/codex-context.py handoff --repo /path/to/project
~~~

جزئیات: [Existing chats](docs/existing-chats.md)

## اندازه‌گیری مصرف Codex

تحلیل context پروژه:

~~~bash
python3 scripts/codex-context.py analyze --repo /path/to/project
~~~

خواندن telemetry محلی Codex:

~~~bash
python3 scripts/codex-context.py usage
~~~

Benchmark قبل/بعد:

~~~bash
python3 scripts/codex-context.py benchmark-start before --repo /path/to/project
# یک task واقعی
python3 scripts/codex-context.py benchmark-end before --repo /path/to/project

python3 scripts/codex-context.py benchmark-start after --repo /path/to/project
# یک task مشابه
python3 scripts/codex-context.py benchmark-end after --repo /path/to/project

python3 scripts/codex-context.py benchmark-compare before after --repo /path/to/project
~~~

کاهش مصرف فقط وقتی موفقیت است که کیفیت، تست‌ها و صحت نتیجه حفظ شده باشد.

## پشتیبانی از ChatGPT Work

برای Work:

~~~bash
python3 scripts/work-context.py init --repo /path/to/project
~~~

این فایل‌ها را بدون overwrite فایل‌های موجود می‌سازد:

~~~text
.context/
├── PROJECT_CONTEXT.md
├── CURRENT_TASK.md
├── DECISIONS.md
└── SOURCE_INDEX.md
~~~

بعد از این prompt استفاده کن:

~~~text
prompts/work-one-shot-setup.md
~~~

اندازه تقریبی context پایدار Work:

~~~bash
python3 scripts/work-context.py analyze --repo /path/to/project
~~~

برای Work ادعای token telemetry دقیق نمی‌کنیم؛ فقط چیزهایی را گزارش می‌کنیم که واقعاً قابل مشاهده‌اند.

## فایل‌های مهم

- [روش کار](docs/methodology.md)
- [Benchmark](docs/benchmarking.md)
- [محافظت از کیفیت](docs/quality-guardrails.md)
- [چت‌های قدیمی](docs/existing-chats.md)
- [Work mode](docs/work-mode.md)

## پروژه‌های upstream

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- OpenAI Codex: https://github.com/openai/codex

## مجوز

MIT
