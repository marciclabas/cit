DEVICE := `$FIND_ANDROID_DEVICE`

help:
  @just --list

# Setup capacitor with android
setup:
  yarn run build
  npx cap add android
  just android build
  just android install-debug
  just android open

# Build android app
build:
  npx cap sync
  cd android && ./gradlew assembleDebug

# Install android app
install-debug DEVICE=(DEVICE):
  echo "Installing to {{DEVICE}}"
  powershell.exe "adb -s {{DEVICE}} install android/app/build/outputs/apk/debug/app-debug.apk"

# Open mobile shell
shell:
  powershell.exe "adb -s {{DEVICE}} shell"

# Uninstall android app
uninstall APP_ID="$APP_ID":
  powershell.exe "adb -s {{DEVICE}} uninstall {{APP_ID}}"

connect ADDR PORT:
  powershell.exe "adb connect 192.168.1.{{ADDR}}:{{PORT}}"

# Restart adb server
restart:
  powershell.exe adb kill-server
  powershell.exe adb start-server

# Find app main activity
find:
  powershell.exe "adb -s ${device} shell cmd 'package resolve-activity --brief -c android.intent.category.LAUNCHER com.moveread.dfy | tail -1'"

# Log from mobile
log:
  powershell.exe "adb -s ${device} logcat" > log.txt

# Open app in mobile
open:
  powershell.exe adb -s {{DEVICE}} shell cmd activity start-activity com.moveread.dfy/.MainActivity
  just dev