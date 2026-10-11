@echo off
REM Windows version of build_apk.sh. Needs Node 18+, JDK 17 and the Android SDK (install Android Studio).
setlocal
cd /d "%~dp0"
call npm install || goto :err
node prepare-web.js || goto :err
if not exist android call npx cap add android || goto :err
call npx @capacitor/assets generate --android --iconBackgroundColor #000000 --iconBackgroundColorDark #000000 --splashBackgroundColor #000000 --splashBackgroundColorDark #000000
call npx cap sync android || goto :err
pushd android
call gradlew.bat assembleDebug || (popd & goto :err)
popd
if not exist dist mkdir dist
copy /y android\app\build\outputs\apk\debug\app-debug.apk dist\ShivTrixAdmin-debug.apk
echo DONE: %~dp0dist\ShivTrixAdmin-debug.apk
if "%CI%"=="" pause
exit /b 0
:err
echo BUILD FAILED.
if "%CI%"=="" pause
exit /b 1
