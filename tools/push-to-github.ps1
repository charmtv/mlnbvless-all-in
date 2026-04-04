#Requires -Version 5.1
<#
.SYNOPSIS
  自动尝试将 main 推送到 origin（多次重试，缓解间歇性网络问题）。
  在仓库根目录执行: .\tools\push-to-github.ps1
#>
$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$remote = "origin"
$branch = "main"
if ($env:GIT_PUSH_RETRIES) { $maxAttempts = [int]$env:GIT_PUSH_RETRIES } else { $maxAttempts = 8 }
if ($env:GIT_PUSH_DELAY_SEC) { $delaySec = [int]$env:GIT_PUSH_DELAY_SEC } else { $delaySec = 4 }

$st = git status --porcelain 2>$null
if ($st) {
    Write-Host "[push] 检测到未提交变更，正在 add + commit ..."
    git add -A
    git diff --cached --quiet 2>$null
    if ($LASTEXITCODE -ne 0) {
        git commit -m "chore: sync $(Get-Date -Format 'yyyy-MM-dd HH:mm')" 2>&1
        if ($LASTEXITCODE -ne 0) { Write-Host "[push] commit 失败，请手动处理后再运行本脚本"; exit 1 }
    }
}

for ($i = 1; $i -le $maxAttempts; $i++) {
    Write-Host "[push] 第 $i / $maxAttempts 次: git push $remote $branch"
    git push $remote $branch 2>&1 | Write-Host
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[push] 成功。"
        exit 0
    }
    Write-Host "[push] 失败，${delaySec}s 后重试..."
    Start-Sleep -Seconds $delaySec
}

Write-Host "[push] 仍失败。可尝试: 换网络 / VPN / git remote set-url 为 SSH"
exit 1
