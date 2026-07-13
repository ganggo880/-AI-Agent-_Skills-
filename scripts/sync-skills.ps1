<#
.SYNOPSIS
  Sync global Claude skills into the project's local skills/ folder so Codex can read them.

.DESCRIPTION
  Mappings:
    ~/.claude/skills/audio-to-srt  ->  skills/audio-to-srt
    ~/.claude/skills/draw          ->  skills/cover-image   (renamed)

  smart-cut is project-native and is NOT synced.

  Default is dry-run. Pass -Apply to actually copy.

  IMPORTANT POLICY:
    skills/*/SKILL.md will be overwritten on sync. Do NOT add project-specific
    rules into those files. Put project-specific rules in CLAUDE.md / AGENTS.md
    (canonical) so sync stays conflict-free.

.EXAMPLE
  ./scripts/sync-skills.ps1
.EXAMPLE
  ./scripts/sync-skills.ps1 -Apply
#>

param([switch]$Apply)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $ProjectRoot

$Mappings = @(
  @{ Src = "$HOME\.claude\skills\audio-to-srt"; Dst = "skills\audio-to-srt" }
  @{ Src = "$HOME\.claude\skills\draw";         Dst = "skills\cover-image" }
)

$ExcludePatterns = @("__pycache__", "*.pyc", "*.pyo", ".DS_Store")

function Get-RelativeFiles {
  param([string]$Root)
  if (-not (Test-Path $Root)) { return @() }
  $absRoot = (Resolve-Path $Root).Path
  Get-ChildItem -Path $absRoot -Recurse -File | Where-Object {
    $path = $_.FullName
    $skip = $false
    foreach ($p in $ExcludePatterns) {
      if ($path -like "*\$p\*" -or $_.Name -like $p) { $skip = $true; break }
    }
    -not $skip
  } | ForEach-Object {
    [PSCustomObject]@{
      Rel  = $_.FullName.Substring($absRoot.Length).TrimStart('\','/')
      Full = $_.FullName
      Hash = (Get-FileHash -Path $_.FullName -Algorithm SHA256).Hash
    }
  }
}

function Compare-SkillDir {
  param([string]$Src, [string]$Dst)

  if (-not (Test-Path $Src)) {
    Write-Host "  [SKIP] source not found: $Src" -ForegroundColor Yellow
    return $null
  }

  $srcFiles = Get-RelativeFiles -Root $Src
  $dstFiles = Get-RelativeFiles -Root $Dst

  $srcMap = @{}
  foreach ($f in $srcFiles) { $srcMap[$f.Rel] = $f }
  $dstMap = @{}
  foreach ($f in $dstFiles) { $dstMap[$f.Rel] = $f }

  $toAdd = @()
  $toUpdate = @()
  $toRemove = @()

  foreach ($rel in $srcMap.Keys) {
    if (-not $dstMap.ContainsKey($rel)) {
      $toAdd += $rel
    } elseif ($dstMap[$rel].Hash -ne $srcMap[$rel].Hash) {
      $toUpdate += $rel
    }
  }
  foreach ($rel in $dstMap.Keys) {
    if (-not $srcMap.ContainsKey($rel)) {
      $toRemove += $rel
    }
  }

  return [PSCustomObject]@{
    Src    = $Src
    Dst    = $Dst
    Add    = $toAdd
    Update = $toUpdate
    Remove = $toRemove
  }
}

function Apply-Sync {
  param($Diff)

  $changed = @()
  $changed += $Diff.Add
  $changed += $Diff.Update

  foreach ($rel in $changed) {
    $src = Join-Path $Diff.Src $rel
    $dst = Join-Path $Diff.Dst $rel
    $dstDir = Split-Path -Parent $dst
    if (-not (Test-Path $dstDir)) {
      New-Item -ItemType Directory -Path $dstDir -Force | Out-Null
    }
    Copy-Item -Path $src -Destination $dst -Force
    Write-Host "    + $rel" -ForegroundColor Green
  }
  foreach ($rel in $Diff.Remove) {
    $dst = Join-Path $Diff.Dst $rel
    if (Test-Path $dst) {
      Remove-Item -Path $dst -Force
      Write-Host "    - $rel" -ForegroundColor Red
    }
  }
}

# === main ===
Write-Host ""
Write-Host "[sync-skills] project root: $ProjectRoot" -ForegroundColor Cyan
if (-not $Apply) {
  Write-Host "[sync-skills] DRY-RUN mode (pass -Apply to actually sync)" -ForegroundColor Yellow
} else {
  Write-Host "[sync-skills] APPLY mode" -ForegroundColor Green
}
Write-Host ""

$totalChanges = 0
$diffs = @()

foreach ($m in $Mappings) {
  Write-Host "compare: $($m.Src)" -ForegroundColor Cyan
  Write-Host "     ->  $($m.Dst)"

  $diff = Compare-SkillDir -Src $m.Src -Dst $m.Dst
  if ($null -eq $diff) {
    Write-Host ""
    continue
  }

  $changes = $diff.Add.Count + $diff.Update.Count + $diff.Remove.Count
  $totalChanges += $changes

  if ($changes -eq 0) {
    Write-Host "  [OK] no diff" -ForegroundColor Green
    Write-Host ""
    continue
  }

  if ($diff.Add.Count -gt 0) {
    Write-Host ("  add:    {0} file(s)" -f $diff.Add.Count) -ForegroundColor Green
    foreach ($r in $diff.Add) { Write-Host "    + $r" }
  }
  if ($diff.Update.Count -gt 0) {
    Write-Host ("  update: {0} file(s)" -f $diff.Update.Count) -ForegroundColor Yellow
    foreach ($r in $diff.Update) { Write-Host "    ~ $r" }
  }
  if ($diff.Remove.Count -gt 0) {
    Write-Host ("  remove: {0} file(s)" -f $diff.Remove.Count) -ForegroundColor Red
    foreach ($r in $diff.Remove) { Write-Host "    - $r" }
  }
  Write-Host ""

  $diffs += $diff
}

if ($totalChanges -eq 0) {
  Write-Host "[sync-skills] all skills are up to date." -ForegroundColor Green
  exit 0
}

if (-not $Apply) {
  Write-Host "[sync-skills] $totalChanges file(s) differ. To apply:" -ForegroundColor Yellow
  Write-Host "  ./scripts/sync-skills.ps1 -Apply" -ForegroundColor Yellow
  Write-Host ""
  exit 0
}

Write-Host "[sync-skills] applying changes..." -ForegroundColor Cyan
foreach ($d in $diffs) {
  Write-Host ""
  Write-Host "-> $($d.Dst)"
  Apply-Sync -Diff $d
}

Write-Host ""
Write-Host "[sync-skills] done. Remember to git add + commit + push." -ForegroundColor Green
