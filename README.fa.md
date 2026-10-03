# Codex Context Optimizer

[English](README.md) | **فارسی** | [Deutsch](README.de.md) | [Español](README.es.md) | [Türkçe](README.tr.md)

کاهش مصرف بی‌دلیل context و توکن در Codex **بدون قربانی‌کردن کیفیت نتیجه**.

## فقط یک مرحله

پروژه را در Codex باز کن و همین متن را بفرست:

~~~text
Install or update Codex Context Optimizer in the CURRENT project from:
https://github.com/TIR3D4/codex-context-optimizer

Set it up automatically, preserve all existing project code and instructions, then continue with my task.

My task:
<کار موردنظر را اینجا بنویس>
~~~

تمام.

بعد از نصب، Codex را کاملاً عادی استفاده کن. لازم نیست خودت `report`، `doctor`، benchmark، handoff یا دستورهای مدیریت context را اجرا کنی.

Optimizer پشت‌صحنه این کارها را مدیریت می‌کند:
- مسیریابی فشرده داخل پروژه
- حفظ AGENTS.md قبلی
- آماده‌سازی Atlas در صورت امکان
- قوانین کاهش context
- بررسی روند مصرف
- بررسی فشار context در مرزهای منطقی task
- آماده‌سازی handoff وقتی چت جدید واقعاً مفید باشد

اگر چت جدید لازم باشد، Codex باید خیلی کوتاه بهت بگوید. اگر لازم نباشد، optimizer مزاحم روند عادی کار نمی‌شود.

## پروژه جدید یا پروژه قدیمی؟

فرقی ندارد.

**همان یک Prompt بالا** را بفرست. خودش تشخیص می‌دهد.

## اگر چت قدیمی Codex داری

بعد از نصب، اگر می‌خواهی همان چت قدیمی را ادامه بدهی فقط یک بار بفرست:

~~~text
Follow .codex-context/REFRESH_OLD_CHAT.md, then continue the current task.
~~~

اگر optimizer تشخیص بدهد context خیلی سنگین شده، بهتر است در مرز مناسب task یک چت جدید باز شود.

## ChatGPT Work

همان نصب، فایل‌های context سبک برای Work را هم آماده می‌کند.

داخل Work بفرست:

~~~text
Follow .codex-context/WORK_SETUP.md, using the .context files as compact navigation.
~~~

<details>
<summary><strong>تنظیمات و ابزارهای پیشرفته</strong></summary>

کاربر عادی به این دستورها نیازی ندارد:

~~~powershell
python .codex-context\tools\codex-context.py report --repo .
python .codex-context\tools\codex-context.py doctor --repo .
python .codex-context\tools\codex-context.py fresh-start --repo .
python .codex-context\tools\codex-context.py analyze --repo .
~~~

نصب اختیاری با ترمینال:

~~~bash
curl -fsSL https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.sh | bash
~~~

مستندات:
- [Automatic Mode](prompts/AUTO_MODE.md)
- [روش کار](docs/methodology.md)
- [حفظ کیفیت](docs/quality-guardrails.md)
- [فشار Context](docs/context-pressure.md)
- [چت‌های قدیمی](docs/existing-chats.md)
- [ChatGPT Work](docs/work-mode.md)
- [Integrationهای اختیاری](docs/integrations.md)

</details>

## مجوز

MIT
