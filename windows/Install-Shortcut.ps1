# No-build option: creates a Desktop shortcut (with the ShivTrix logo) that starts the companion via Python.
# Right-click -> "Run with PowerShell". Requires Python 3 installed.
$web  = Join-Path (Split-Path -Parent $PSScriptRoot) "web"
$bat  = Join-Path $web "companion.bat"
$icon = Join-Path $web "assets\shivtrix.ico"
if (-not (Test-Path $bat)) { Write-Host "companion.bat not found next to this folder." -ForegroundColor Red; exit 1 }
$lnk = Join-Path ([Environment]::GetFolderPath("Desktop")) "ShivTrix Admin.lnk"
$sh = New-Object -ComObject WScript.Shell
$s = $sh.CreateShortcut($lnk)
$s.TargetPath = $bat; $s.WorkingDirectory = $web; $s.IconLocation = $icon; $s.WindowStyle = 7; $s.Description = "ShivTrix Admin"
$s.Save()
Write-Host "Shortcut created on your Desktop: $lnk" -ForegroundColor Green
