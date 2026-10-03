$ErrorActionPreference = "Stop"

# Codex Context Optimizer - lightweight Windows installer/updater
# Run from the project root:
# irm https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main/install.ps1 | iex

$Target = (Get-Location).Path
$Base = "https://raw.githubusercontent.com/TIR3D4/codex-context-optimizer/main"

function Get-OptimizerFile {
    param(
        [Parameter(Mandatory=$true)][string]$Remote,
        [Parameter(Mandatory=$true)][string]$Local
    )
    $dir = Split-Path -Parent $Local
    if ($dir -and -not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    $tmp = "$Local.download"
    Invoke-WebRequest -UseBasicParsing -Uri "$Base/$Remote" -OutFile $tmp
    Move-Item -Force $tmp $Local
}

$ContextDir = Join-Path $Target ".codex-context"
$ToolsDir = Join-Path $ContextDir "tools"
$WorkDir = Join-Path $Target ".context"
New-Item -ItemType Directory -Force -Path $ToolsDir, $WorkDir | Out-Null

# Small runtime files only. No repository clone and no broad source scan.
Get-OptimizerFile "scripts/codex-context.py" (Join-Path $ToolsDir "codex-context.py")
Get-OptimizerFile "scripts/work-context.py" (Join-Path $ToolsDir "work-context.py")
Get-OptimizerFile "prompts/AUTO_MODE.md" (Join-Path $ContextDir "AUTO_MODE.md")
Get-OptimizerFile "prompts/existing-chat-refresh.md" (Join-Path $ContextDir "REFRESH_OLD_CHAT.md")
Get-OptimizerFile "prompts/work-one-shot-setup.md" (Join-Path $ContextDir "WORK_SETUP.md")

foreach ($name in @("PROJECT_CONTEXT.md","CURRENT_TASK.md","DECISIONS.md","SOURCE_INDEX.md")) {
    $dest = Join-Path $WorkDir $name
    if (-not (Test-Path $dest)) {
        Get-OptimizerFile "templates/work/$name" $dest
    }
}

# Make automatic mode discoverable by every new Codex chat.
$Agents = Join-Path $Target "AGENTS.md"
$markerStart = "<!-- codex-context-optimizer:auto:start -->"
$markerEnd = "<!-- codex-context-optimizer:auto:end -->"
$block = @"

$markerStart
## Codex Context Optimizer
- Read `.codex-context/AUTO_MODE.md` and follow it during normal work.
- Preserve existing project instructions; optimizer rules are subordinate to correctness and project safety.
- Do not require the user to run optimizer maintenance commands during normal tasks.
$markerEnd
"@

if (Test-Path $Agents) {
    $existing = Get-Content -Raw -LiteralPath $Agents
    if ($existing -notmatch [regex]::Escape($markerStart)) {
        Add-Content -LiteralPath $Agents -Value $block -Encoding UTF8
    }
} else {
    Get-OptimizerFile "templates/AGENTS.md" $Agents
}

# Save one historical baseline only once.
$Baseline = Join-Path $ContextDir "install-baseline.json"
if (-not (Test-Path $Baseline)) {
    $Python = $null
    if (Get-Command python -ErrorAction SilentlyContinue) { $Python = "python" }
    elseif (Get-Command py -ErrorAction SilentlyContinue) { $Python = "py" }

    if ($Python) {
        try {
            & $Python (Join-Path $ToolsDir "codex-context.py") usage --json |
                Set-Content -LiteralPath $Baseline -Encoding UTF8
        } catch {
            Remove-Item -Force -ErrorAction SilentlyContinue $Baseline
        }
    }
}

# Refresh Atlas only if the user already has it. Never install extra tooling silently.
if (Get-Command atlas -ErrorAction SilentlyContinue) {
    try {
        Push-Location $Target
        & atlas . --for-agent --budget 2048 -o atlas-map.md | Out-Null
    } catch {
        # Atlas is optional; installation should still succeed.
    } finally {
        Pop-Location
    }
}

$Mode = if (Test-Path (Join-Path $Target ".git")) { "git-project" } else { "project-without-git" }
@"
Codex Context Optimizer
Mode: $Mode
Automatic mode: enabled

Normal use:
Just write your task in Codex.

No report/doctor/benchmark commands are required unless you explicitly want diagnostics.
"@ | Set-Content -LiteralPath (Join-Path $ContextDir "STATUS.txt") -Encoding UTF8

Write-Host ""
Write-Host "Codex Context Optimizer is ready." -ForegroundColor Green
Write-Host "Project: $Target"
Write-Host "Automatic mode: ON"
Write-Host "Normal use: just open a Codex chat in this project and write your task."
