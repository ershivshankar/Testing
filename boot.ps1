# boot.ps1 — KeyStone 1-Line Remote Installer & Launcher

$ErrorActionPreference = "Continue"

$repoOwner  = "ershivshankar"
$repoName   = "Testing"
$branch     = "main"
$installDir = "$env:LOCALAPPDATA\ACEx_Launcher"
$zipUrl     = "https://raw.githubusercontent.com/$repoOwner/$repoName/$branch/ACEx_Package.zip"
$tempZip    = "$env:TEMP\ACEx_Package.zip"

Write-Host ""
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "          KEYSTONE / ACEX AUTO-BOOTSTRAP              " -ForegroundColor Yellow
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Download
Write-Host "[1/4] Downloading latest package from GitHub..." -ForegroundColor Green
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
curl.exe -sL "$zipUrl" -o "$tempZip"

# 2. Extract
Write-Host "[2/4] Extracting to $installDir..." -ForegroundColor Green
Get-Process "acex-lite-final", "python" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Milliseconds 500

if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}
Expand-Archive -Path $tempZip -DestinationPath $installDir -Force
Remove-Item $tempZip -Force -ErrorAction SilentlyContinue

# 3. Setup (Hosts, Certs, Zero-UAC Scheduled Task)
Write-Host "[3/4] Configuring environment..." -ForegroundColor Green
$setupBat = Join-Path $installDir "SETUP_ONCE.bat"
if (Test-Path $setupBat) {
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$setupBat`"" -WorkingDirectory $installDir -Wait
}

# 4. Launch
Write-Host "[4/4] Starting ACEx Lite..." -ForegroundColor Green
$launchBat = Join-Path $installDir "launch_acex.bat"
if (Test-Path $launchBat) {
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$launchBat`"" -WorkingDirectory $installDir
}

Write-Host ""
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "  Setup complete. ACEx Lite is launched." -ForegroundColor Green
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""
