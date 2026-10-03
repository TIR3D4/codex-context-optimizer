# Codex Context Optimizer

[English](README.md) | **فارسی** | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

کاهش مصرف بی‌دلیل context و توکن در Codex **بدون قربانی‌کردن کیفیت نتیجه**.

## ویندوز: فقط یک دستور

PowerShell را داخل پوشه پروژه باز کن و بزن:

~~~powershell
irm https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.ps1 | iex
~~~

تمام.

بعد پروژه را در Codex باز کن و فقط task خودت را بنویس. برای هر چت جدید نیازی به Prompt مخصوص نصب یا optimizer نداری.

Installer فقط فایل‌های کوچک موردنیاز را مستقیم دانلود می‌کند. لازم نیست Codex کل repository ابزار را clone، بخواند یا خلاصه کند؛ بنابراین خود نصب هم context و توکن اضافی زیادی مصرف نمی‌کند.

## macOS / Linux

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

## چه چیزهایی خودکار می‌شود؟

بعد از نصب، Codex دستورهای فشرده‌ای برای این موارد دارد:

- پیدا کردن هدفمند فایل‌های مرتبط
- استفاده از Atlas وقتی موجود است
- حفظ دستورهای قبلی پروژه
- کنترل آرام فشار context
- ساخت handoff وقتی واقعاً چت جدید مفید باشد
- Git Safety خودکار در پروژه‌هایی که از قبل Git دارند

### Git Safety

اگر پروژه Git داشته باشد، Codex از بررسی‌های سبک مثل status و diff هدفمند برای محافظت از تغییرات استفاده می‌کند.

به‌صورت خودکار این کارها را نمی‌کند:
- ساخت Git برای پروژه‌ای که Git ندارد
- reset / clean / stash کردن تغییرات کاربر
- commit کردن فایل‌های نامرتبط
- ساخت branch یا worktree برای هر task کوچک

Worktree فقط برای کارهای موازی، بزرگ یا پرریسک استفاده می‌شود که isolation واقعاً ارزش داشته باشد.

## نصب از داخل خود Codex

اگر ترجیح می‌دهی Codex نصب را انجام بدهد، فقط بفرست:

~~~text
Install or update Codex Context Optimizer in this project using:
https://github.com/TIR3D4/codex-context-optimizer/blob/main/prompts/install-and-run.md

Use the lightweight installer. Do not inspect the optimizer repository. Then continue with my task.
~~~

## استفاده عادی

بعد از نصب فقط task بنویس:

~~~text
مشکل ثبت پرداخت را پیدا کن، اصلاح کن و بخش مرتبط را تست کن.
~~~

نیازی نیست خودت `report`، `doctor`، benchmark، handoff یا دستورهای Git ابزار را مدیریت کنی.

<details>
<summary><strong>ابزارهای پیشرفته و عیب‌یابی</strong></summary>

~~~powershell
python .codex-context\tools\codex-context.py report --repo .
python .codex-context\tools\codex-context.py doctor --repo .
python .codex-context\tools\codex-context.py fresh-start --repo .
python .codex-context\tools\codex-context.py analyze --repo .
~~~

مستندات:
- [Automatic Mode](prompts/AUTO_MODE.md)
- [Git Safety](docs/git-safety.md)
- [روش کار](docs/methodology.md)
- [حفظ کیفیت](docs/quality-guardrails.md)
- [فشار Context](docs/context-pressure.md)
- [چت‌های قدیمی](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [Integrationهای اختیاری](docs/integrations.md)

</details>

## مجوز

MIT
