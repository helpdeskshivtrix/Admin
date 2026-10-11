# ShivTrix Admin for Windows

Pick ONE of these three ways. They all run the same companion (remote-control engine + web server) on `http://127.0.0.1:9871`.

## A. No build needed (fastest)
1. Install Python 3 from python.org (tick "Add python.exe to PATH").
2. Double-click `..\web\companion.bat`. Optional: right-click `Install-Shortcut.ps1` -> Run with PowerShell for a Desktop icon.

## B. Build the .exe on your own Windows PC
1. Install Python 3.9+ (tick "Add to PATH").
2. Double-click `build_exe.bat`.
3. Results in `windows\dist\`:
   * `ShivTrixAdmin.exe` - normal mode.
   * `ShivTrixAdmin-Elevated.exe` - asks for administrator; needed only if a technician must control windows that run as administrator.
4. Optional installer: install **Inno Setup 6**, open `ShivTrixAdmin.iss`, press Compile -> `dist\ShivTrixAdmin-Setup.exe`.

## C. Let GitHub build it for you (free)
Push this whole folder to a GitHub repository, open **Actions -> Build Windows EXE -> Run workflow**, then download the **ShivTrixAdmin-Windows** artifact (EXE files + installer).

## Good to know
* Unsigned programs make Windows SmartScreen show "unknown publisher" (More info -> Run anyway). Removing it needs a paid code-signing certificate.
* When a technician asks for control, Windows shows an "Allow remote control?" dialog. Only click **Yes** for people you trust.
* Antivirus tools sometimes flag PyInstaller one-file programs; the source is `web\companion.py` - you can read it.
