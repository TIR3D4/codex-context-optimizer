# Codex Context Optimizer

[English](README.md) | **فارسی** | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

کاهش مصرف بی‌دلیل context و توکن در Codex **بدون قربانی‌کردن کیفیت نتیجه**.

## ساده‌ترین روش نصب — فقط یک متن داخل Codex

پروژه‌ات را در Codex باز کن و این متن را بفرست:

~~~text
Install Codex Context Optimizer into the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Use prompts/install-and-run.md from that repository as the installation instructions.
Detect my OS and available tools, install it safely without overwriting application code, preserve any existing AGENTS.md, then follow the generated .codex-context/SETUP.md and continue with my task.
~~~

بعد پایینش task خودت را بنویس.

مثلاً:

~~~text
Install Codex Context Optimizer into the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Use prompts/install-and-run.md from that repository as the installation instructions.
Detect my OS and available tools, install it safely without overwriting application code, preserve any existing AGENTS.md, then follow the generated .codex-context/SETUP.md and continue with my task.

My task:
خطای 500 در API لاگین را پیدا و اصلاح کن.
~~~

تمام.

Codex خودش سیستم‌عامل و ابزارهای موجود را تشخیص می‌دهد و لازم نیست کاربر بداند Bash، PowerShell یا Git Bash دارد یا نه.

## چه کاری خودکار انجام می‌شود؟

- تشخیص پروژه جدید یا موجود
- حفظ کد اصلی برنامه
- حفظ AGENTS.md و دستورالعمل‌های موجود
- آماده‌سازی Atlas در صورت امکان
- ساخت context فشرده
- آماده‌سازی اندازه‌گیری مصرف، benchmark و handoff
- اولویت‌دادن به کیفیت و صحت نتیجه نسبت به کاهش توکن

اصل پروژه:

> با حداقل context کافی شروع کن و هر زمان صحت نتیجه نیاز داشت، context را گسترش بده.

## اگر چت قدیمی Codex داری

برای بهترین نتیجه، بعد از نصب یک چت جدید باز کن.

اگر می‌خواهی همان چت قدیمی را ادامه بدهی:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

## ChatGPT Work

بعد از نصب، داخل Work بفرست:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

## نصب با ترمینال — اختیاری

اگر خودت ترجیح می‌دهی با command نصب کنی:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

این روش اختیاری است. برای سادگی و سازگاری با ویندوز، روش نصب از داخل Codex پیشنهاد می‌شود.

## ببین واقعاً چقدر تاثیر داشته

فقط همین یک دستور را بزن:

~~~powershell
python .codex-context\tools\codex-context.py report --repo .
~~~

گزارش جدید نشان می‌دهد:
- روند زنده قبل/بعد؛
- همه responseهای بعد از optimizer، نه فقط یک benchmark ثابت؛
- مصرف session آخر؛
- فشار context window؛
- بهتر یا بدتر شدن درصد صرفه‌جویی نسبت به گزارش قبلی؛
- پیشنهاد چت جدید وقتی context به HIGH یا CRITICAL برسد.

مثلاً:

~~~text
Estimated saving:       22.9% per response
Context pressure:       HIGH
Since last report:      declined 7.1 percentage points

Recommended action:
python .codex-context\tools\codex-context.py fresh-start --repo .
~~~

برای بررسی سلامت setup:

~~~powershell
python .codex-context\tools\codex-context.py doctor --repo .
~~~

اگر چت طولانی و سنگین شد:

~~~powershell
python .codex-context\tools\codex-context.py fresh-start --repo .
~~~

این دستور یک handoff فشرده بر اساس وضعیت Git می‌سازد و متن آماده برای شروع چت جدید را نمایش می‌دهد.

> درصد بالای Cached Input به‌تنهایی بد نیست. معیار مهم‌تر برای ما رشد مصرف متوسط هر response و میزان پرشدن context window است.

اگر خواستی ساختار repository را جدا بررسی کنی:

~~~powershell
python .codex-context\tools\codex-context.py analyze --repo .
~~~

## مستندات

- [Prompt نصب مستقیم از داخل چت](prompts/install-and-run.md)
- [روش کار](docs/methodology.md)
- [Benchmark](docs/benchmarking.md)
- [حفظ کیفیت](docs/quality-guardrails.md)
- [چت‌های قدیمی](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [فشار Context و Fresh Start](docs/context-pressure.md)
- [Integrationهای اختیاری](docs/integrations.md)

## مجوز

MIT
