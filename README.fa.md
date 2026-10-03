# Codex Context Optimizer

[English](README.md) | **فارسی** | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

کاهش مصرف بی‌دلیل context و توکن در Codex **بدون قربانی‌کردن کیفیت نتیجه**.

## نصب سریع

داخل پوشه پروژه فقط این دستور را اجرا کن:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

تمام.

اسکریپت خودش تشخیص می‌دهد پروژه **جدید** است یا **از قبل وجود دارد** و تنظیم مناسب را انجام می‌دهد؛ بدون اینکه کد اصلی برنامه را overwrite کند.

بعد پروژه را در یک **چت جدید Codex** باز کن و فقط این را بفرست:

~~~text
Follow .codex-context/SETUP.md, then continue with my task.
~~~

بعد درخواستت را عادی ادامه بده.

مثلاً:

~~~text
Follow .codex-context/SETUP.md, then continue with my task.

برای API لاگین rate limit اضافه کن.
~~~

## چه کاری انجام می‌دهد؟

به‌صورت خودکار این موارد را برای پروژه آماده می‌کند:

- Atlas برای نقشه فشرده پروژه
- AGENTS.md کوتاه و بهینه
- حفظ امن دستورالعمل‌های قبلی پروژه
- اندازه‌گیری مصرف Codex
- benchmark قبل/بعد
- handoff برای چت‌های طولانی
- فایل‌های context مخصوص ChatGPT Work

اصل پروژه ساده است:

> با حداقل context کافی شروع کن و هر زمان صحت نتیجه نیاز داشت، context را گسترش بده.

## اگر از قبل چت Codex داری

می‌توانی همان چت را ادامه بدهی. فقط یک بار داخل چت قدیمی بفرست:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

ولی برای کمترین context و نتیجه تمیزتر، بعد از نصب **چت جدید پیشنهاد می‌شود**.

## اگر به‌جای Codex از ChatGPT Work استفاده می‌کنی

بعد از همان دستور نصب، داخل Work بفرست:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

## مشاهده مصرف توکن

بعد از نصب:

~~~bash
python3 .codex-context/tools/codex-context.py usage
~~~

تحلیل context پروژه:

~~~bash
python3 .codex-context/tools/codex-context.py analyze --repo .
~~~

برای benchmark قبل و بعد:

~~~bash
python3 .codex-context/tools/codex-context.py benchmark-start before --repo .
# یک task واقعی با Codex انجام بده
python3 .codex-context/tools/codex-context.py benchmark-end before --repo .
~~~

بعد همین کار را با نام `after` انجام بده و مقایسه کن:

~~~bash
python3 .codex-context/tools/codex-context.py benchmark-compare before after --repo .
~~~

کاهش توکن فقط وقتی موفقیت محسوب می‌شود که کیفیت و صحت نتیجه حفظ شده باشد.

<details>
<summary><strong>تنظیمات پیشرفته</strong></summary>

### اجبار حالت پروژه جدید

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode new
~~~

### اجبار حالت پروژه موجود

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --mode existing
~~~

### نصب روی مسیر مشخص

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash -s -- --target /path/to/project
~~~

### مستندات

- [روش کار](docs/methodology.md)
- [Benchmark](docs/benchmarking.md)
- [حفظ کیفیت](docs/quality-guardrails.md)
- [چت‌های قدیمی](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)

### پروژه‌های upstream

- Atlas: https://github.com/fkenmar/atlas
- agents-md-generator: https://github.com/nguyenthedat123/agents-md-generator
- OpenAI Codex: https://github.com/openai/codex

</details>

> نکته امنیتی: اگر نمی‌خواهی یک اسکریپت اینترنتی را مستقیم به Bash بدهی، اول فایل [install.sh](install.sh) را بررسی کن یا repo را clone کن و محلی اجرا کن.

## مجوز

MIT
