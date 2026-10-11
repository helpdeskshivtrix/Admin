#!/usr/bin/env bash
# Builds a debug APK (installable; signed with the standard debug key).
# Needs: Node 18+, JDK 17, Android SDK (Android Studio installs all of it). Works on Linux/macOS/WSL/CI.
set -e
cd "$(dirname "$0")"
npm install
node prepare-web.js
[ -d android ] || npx cap add android
npx @capacitor/assets generate --android --iconBackgroundColor '#000000' --iconBackgroundColorDark '#000000' --splashBackgroundColor '#000000' --splashBackgroundColorDark '#000000' || echo "(icon generation skipped)"
npx cap sync android
(cd android && ./gradlew assembleDebug)
mkdir -p dist && cp android/app/build/outputs/apk/debug/app-debug.apk dist/ShivTrixAdmin-debug.apk
echo "DONE -> $(pwd)/dist/ShivTrixAdmin-debug.apk"
