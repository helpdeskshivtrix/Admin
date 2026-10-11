; Inno Setup 6 script - creates ShivTrixAdmin-Setup.exe (per-user install, no admin rights needed)
[Setup]
AppName=ShivTrix Admin
AppVersion=4.2
AppPublisher=ShivTrix
DefaultDirName={autopf}\ShivTrix Admin
DefaultGroupName=ShivTrix Admin
OutputDir=dist
OutputBaseFilename=ShivTrixAdmin-Setup
SetupIconFile=..\web\assets\shivtrix.ico
UninstallDisplayIcon={app}\shivtrix.ico
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
WizardStyle=modern
DisableProgramGroupPage=yes

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Shortcuts:"

[Files]
Source: "dist\ShivTrixAdmin.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\ShivTrixAdmin-Elevated.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\web\assets\shivtrix.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\ShivTrix Admin"; Filename: "{app}\ShivTrixAdmin.exe"; IconFilename: "{app}\shivtrix.ico"
Name: "{group}\ShivTrix Admin (Administrator mode)"; Filename: "{app}\ShivTrixAdmin-Elevated.exe"; IconFilename: "{app}\shivtrix.ico"
Name: "{autodesktop}\ShivTrix Admin"; Filename: "{app}\ShivTrixAdmin.exe"; IconFilename: "{app}\shivtrix.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\ShivTrixAdmin.exe"; Description: "Launch ShivTrix Admin"; Flags: nowait postinstall skipifsilent
