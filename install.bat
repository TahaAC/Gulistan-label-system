@echo off
title Gulistan Price Tags - Installer
color 0A
echo.
echo ============================================
echo   Gulistan Price Tags - Desktop Installer
echo ============================================
echo.
echo Installing application...
echo.

:: Get current directory
set APP_DIR=%~dp0
set APP_PATH=%APP_DIR%standalone.html

:: Create launcher script
echo @echo off > "%APP_DIR%launch.bat"
echo start "" chrome.exe --app="file:///%APP_PATH:\=/%" --window-size=1400,900 >> "%APP_DIR%launch.bat"

:: Create Desktop Shortcut
echo Creating desktop shortcut...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\Gulistan Price Tags.lnk'); $Shortcut.TargetPath = '%APP_DIR%launch.bat'; $Shortcut.WorkingDirectory = '%APP_DIR%'; $Shortcut.IconLocation = '%APP_DIR%logo.png'; $Shortcut.Description = 'Gulistan Price Tags - Barcode Label System'; $Shortcut.Save()"

:: Create Start Menu Shortcut
echo Creating Start Menu shortcut...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan" mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan"
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan\Gulistan Price Tags.lnk'); $Shortcut.TargetPath = '%APP_DIR%launch.bat'; $Shortcut.WorkingDirectory = '%APP_DIR%'; $Shortcut.IconLocation = '%APP_DIR%logo.png'; $Shortcut.Description = 'Gulistan Price Tags - Barcode Label System'; $Shortcut.Save()"

:: Create uninstaller
echo @echo off > "%APP_DIR%uninstall.bat"
echo title Gulistan Price Tags - Uninstaller >> "%APP_DIR%uninstall.bat"
echo echo Removing shortcuts... >> "%APP_DIR%uninstall.bat"
echo del "%%USERPROFILE%%\Desktop\Gulistan Price Tags.lnk" 2^>nul >> "%APP_DIR%uninstall.bat"
echo del "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Gulistan\Gulistan Price Tags.lnk" 2^>nul >> "%APP_DIR%uninstall.bat"
echo rmdir "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Gulistan" 2^>nul >> "%APP_DIR%uninstall.bat"
echo del "%%~dp0launch.bat" 2^>nul >> "%APP_DIR%uninstall.bat"
echo echo. >> "%APP_DIR%uninstall.bat"
echo echo Uninstall complete! >> "%APP_DIR%uninstall.bat"
echo pause >> "%APP_DIR%uninstall.bat"

echo.
echo ============================================
echo   Installation Complete!
echo ============================================
echo.
echo Application installed successfully!
echo.
echo Shortcuts created:
echo   - Desktop: Gulistan Price Tags
echo   - Start Menu: Gulistan ^> Gulistan Price Tags
echo.
echo To uninstall, run: uninstall.bat
echo.
echo Press any key to launch the app...
pause > nul

:: Launch the app
start "" "%APP_DIR%launch.bat"
