@echo off
REM Builds ShivTrixAdmin.exe (and an elevated variant) with PyInstaller. Run on Windows with Python 3.9+.
setlocal
cd /d "%~dp0"
set PY=python
where python >nul 2>nul || set PY=py -3
echo [1/3] Installing build tools...
%PY% -m pip install --upgrade pyinstaller psutil || goto :err
set WEB=%~dp0..\web
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
set DATA=--add-data "%WEB%\shivtrix_core.html;." --add-data "%WEB%\index.html;." --add-data "%WEB%\style.css;." --add-data "%WEB%\script.js;." --add-data "%WEB%\manifest.json;." --add-data "%WEB%\sw.js;." --add-data "%WEB%\assets;assets"
echo [2/3] Building ShivTrixAdmin.exe ...
%PY% -m PyInstaller --noconfirm --clean --onefile --name ShivTrixAdmin --icon "%WEB%\assets\shivtrix.ico" %DATA% --hidden-import psutil --distpath "%~dp0dist" --workpath "%~dp0build" --specpath "%~dp0build" "%WEB%\companion.py" || goto :err
echo [3/3] Building ShivTrixAdmin-Elevated.exe (asks for administrator; can control elevated windows) ...
%PY% -m PyInstaller --noconfirm --onefile --uac-admin --name ShivTrixAdmin-Elevated --icon "%WEB%\assets\shivtrix.ico" %DATA% --hidden-import psutil --distpath "%~dp0dist" --workpath "%~dp0build" --specpath "%~dp0build" "%WEB%\companion.py" || goto :err
echo.
echo DONE. Files are in %~dp0dist
if "%CI%"=="" pause
exit /b 0
:err
echo BUILD FAILED.
if "%CI%"=="" pause
exit /b 1
