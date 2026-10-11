# ShivTrix Admin for Android

On a phone or tablet ShivTrix Admin is the **technician** app: join a room, watch the host screen and control it with touch
(Direct touch / Touchpad), the on-screen keyboard and the Keys menu, and run Power Toys on the host.
(Android browsers and WebViews cannot share their own screen, so a phone cannot be the *host* of a screen-share session.)

## Option 1 - install as an app right now (no APK needed)
Open your GitHub Pages address in **Chrome** on Android -> menu -> **Install app**. Chrome generates a real Android app (WebAPK)
with the ShivTrix logo, full-screen, offline-capable.

## Option 2 - build an APK file
Needs Node 18+, JDK 17 and the Android SDK (Android Studio). Then: `bash build_apk.sh` (or `build_apk.bat` on Windows).
Output: `android/dist/ShivTrixAdmin-debug.apk`. Enable "Install unknown apps" on the phone and open the file.

## Option 3 - GitHub builds it for you (free)
Push this folder to GitHub -> **Actions -> Build Android APK -> Run workflow** -> download the **ShivTrixAdmin-Android** artifact.

## Signed release APK / Play Store
The debug APK is for your own devices. For the Play Store build a release bundle in Android Studio (`npx cap open android`),
create a keystore (`keytool -genkey -v -keystore shivtrix.jks -alias shivtrix -keyalg RSA -keysize 2048 -validity 10000`)
and sign with it. Keep the keystore and passwords safe - you cannot update the app without them.
