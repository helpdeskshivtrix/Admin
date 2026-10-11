# ShivTrix Admin v4.2 PRO

Remote control (mouse, touch, keyboard), hardware telemetry, network Power Toys and IT toolkit - OLED-black interface with the ShivTrix blue-and-gold identity.

```
ShivTrixAdmin/
  web/        PWA + companion. Deploy this folder to GitHub Pages; run companion.bat on the host PC
  windows/    Build kit for ShivTrixAdmin.exe + installer (build_exe.bat, Inno Setup script, shortcut script)
  android/    Build kit for the Android APK (Capacitor)
  docs/       White Paper (PDF) and Standard Operating Procedure (PDF)
  .github/    One-click cloud builds: Pages, Windows EXE, Android APK
```

## What is ready and what you still need to run
| Deliverable | State |
| --- | --- |
| PWA / website (`web/`) | **Ready.** Installable, offline-capable, logo + theme applied. Upload and open. |
| Windows companion | **Ready to run** (`web/companion.bat`, needs Python). |
| Windows `.exe` / installer | **Build kit ready.** A prebuilt EXE needs a Windows machine - run `windows\build_exe.bat` or let GitHub build it (below). |
| Android `.apk` | **Build kit ready.** A prebuilt APK needs the Android SDK - run `android/build_apk.sh` or let GitHub build it. Or install the PWA from Chrome right now. |
| White Paper / SOP | **Ready** (`docs/`). |

## Fastest path (about 10 minutes, no software to install)
1. Create a GitHub repository and upload everything in this folder (Add file -> Upload files).
2. **Settings -> Pages -> Source: GitHub Actions.** The *Deploy PWA* workflow publishes `web/` at `https://<you>.github.io/<repo>/`.
3. **Actions -> Build Windows EXE -> Run workflow** -> download artifact **ShivTrixAdmin-Windows** (EXE files + installer).
4. **Actions -> Build Android APK -> Run workflow** -> download artifact **ShivTrixAdmin-Android**.
5. On Android you can also open the Pages address in Chrome -> **Install app**.

## Using it
* **Host (the PC being helped):** run ShivTrix Admin (EXE) or `web/companion.bat` -> Remote Resolve -> Capture & Share Screen (Entire Screen) -> send the link.
* **Technician:** open the link on any device -> Join. For control the host selects *Assisted Control* and answers **Yes** to the Windows dialog.
* Full procedures, troubleshooting and a pilot acceptance test are in `docs/ShivTrix_Admin_SOP.pdf`; design, security model and limits are in `docs/ShivTrix_Admin_Whitepaper.pdf`.

## Honest status
Automated tests (24 checks) cover access control, mouse, touch, keyboard, tools on host, the 10-peer limit and the PWA - using a simulated peer network. Not yet verified: real Windows input injection, the public PeerJS/TURN services under real latency, and the packaged EXE/APK. Run the pilot checklist (SOP section 13) first. Binaries you build are unsigned.
