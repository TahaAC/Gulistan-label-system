# Gulistan Price Tags - PowerShell Installer
# Run this script with: powershell -ExecutionPolicy Bypass -File install.ps1

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  Gulistan Price Tags - Desktop Installer" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

$appDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$appPath = Join-Path $appDir "standalone.html"
$appPathUri = ([System.Uri]$appPath).AbsoluteUri

Write-Host "Installing from: $appDir" -ForegroundColor Cyan
Write-Host ""

# Create launcher batch file
$launcherPath = Join-Path $appDir "launch.bat"
@"
@echo off
start "" chrome.exe --app="file:///$($appPath -replace '\\','/')" --window-size=1400,900
"@ | Out-File -FilePath $launcherPath -Encoding ASCII

Write-Host "[1/4] Launcher created..." -ForegroundColor Yellow

# Create Desktop Shortcut
try {
    $WshShell = New-Object -ComObject WScript.Shell
    $desktopPath = [System.Environment]::GetFolderPath('Desktop')
    $shortcut.TargetPath = $launcherPath
    $shortcut.WorkingDirectory = $appDir
    $shortcut.IconLocation = Join-Path $appDir "logo.png"
    $shortcut.Description = "Gulistan Price Tags - Barcode Label System"
    $shortcut.Save()
    Write-Host "[2/4] Desktop shortcut created..." -ForegroundColor Yellow
} catch {
    Write-Host "[!] Failed to create desktop shortcut: $_" -ForegroundColor Red
}

# Create Start Menu Shortcut
try {
    $startMenuPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Gulistan"
    if (!(Test-Path $startMenuPath)) {
        New-Item -ItemType Directory -Path $startMenuPath -Force | Out-Null
    }
    $shortcut = $WshShell.CreateShortcut("$startMenuPath\Gulistan Price Tags.lnk")
    $shortcut.TargetPath = $launcherPath
    $shortcut.WorkingDirectory = $appDir
    $shortcut.IconLocation = Join-Path $appDir "logo.png"
    $shortcut.Description = "Gulistan Price Tags - Barcode Label System"
    $shortcut.Save()
    Write-Host "[3/4] Start Menu shortcut created..." -ForegroundColor Yellow
} catch {
    Write-Host "[!] Failed to create Start Menu shortcut: $_" -ForegroundColor Red
}

# Create Uninstaller
$uninstallerPath = Join-Path $appDir "uninstall.bat"
@"
@echo off
title Gulistan Price Tags - Uninstaller
echo.
echo Removing shortcuts...
del "%USERPROFILE%\Desktop\Gulistan Price Tags.lnk" 2>nul
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan\Gulistan Price Tags.lnk" 2>nul
rmdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan" 2>nul
del "%~dp0launch.bat" 2>nul
del "%~dp0uninstall.bat" 2>nul
echo.
echo Uninstall complete!
echo.
pause
"@ | Out-File -FilePath $uninstallerPath -Encoding ASCII

Write-Host "[4/4] Uninstaller created..." -ForegroundColor Yellow

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  Installation Complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "✓ Desktop shortcut: " -NoNewline -ForegroundColor White
Write-Host "Gulistan Price Tags" -ForegroundColor Cyan
Write-Host "✓ Start Menu: " -NoNewline -ForegroundColor White
Write-Host "Gulistan > Gulistan Price Tags" -ForegroundColor Cyan
Write-Host ""
Write-Host "To uninstall, run: " -NoNewline -ForegroundColor White
Write-Host "uninstall.bat" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to launch the app..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Launch the app
Start-Process $launcherPath
