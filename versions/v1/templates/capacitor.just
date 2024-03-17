setup: config init

# Initialize android project
init:
  yarn
  yarn run build
  npx cap sync
  [ -d android ] && rm -dr android || :
  npx cap add android
  @ echo "You're all set! Run 'just start' to build the android app and install on your phone"

# Set .env file
config:
  @ echo "App name? (defaults to 'My App')" && read app_name && \
    echo "App id? (defaults to 'com.capacitor-vite.app')" && read app_id && \
    echo "PC LAN IP? (Enter to skip and set later, defaults to 192.168.1.128)" && read lan_ip && \
    echo "Phone LAN IP? [You can get it on 'Developer Options, Wireless Debugging', defaults to 192.168.1.133]" && read phone_ip && \
    echo "Phone Port? [You can get it on 'Developer Options, Wireless Debugging']" && read port && \
    echo 'PORT="5173"' > .env && \
    echo "APP_NAME=\"${app_name:-My App}\"" >> .env && \
    echo "APP_ID=\"${app_id:-com.capacitor-vite.app}\"" >> .env && \
    echo "PC_LAN_IP=\"${lan_ip:-192.168.1.128}\"" >> .env && \
    echo "PHONE_URL=\"${phone_ip:-192.168.1.133}:${port:-6969}\"" >> .env

start: android-build android

# Connect to phone and install and run app there
android: connect install run

# Build android app
android-build:
  cd android && ./gradlew syncDebugLibJars
  cd android && ./gradlew assembleDebug

# Pair phone (see https://developer.android.com/tools/adb#wireless-android11-command-line for details)
pair PAIR_URL:
  powershell.exe adb pair {{PAIR_URL}}

# Restart adb server
restart:
  powershell.exe adb kill-server
  powershell.exe adb start-server

# Connect to phone
connect PHONE_URL="$PHONE_URL":
  powershell.exe adb connect {{PHONE_URL}}

# Install app on phone (must be connected first)
install PHONE_URL="$PHONE_URL":
  @ echo "Installing app on your phone. Do accept it if you're prompted"
  powershell.exe adb -s {{PHONE_URL}} install android/app/build/outputs/apk/debug/app-debug.apk

# Run app on phone (must be installed first)
run PHONE_URL="$PHONE_URL" APP="$APP_ID":
  powershell.exe adb -s {{PHONE_URL}} shell cmd activity start-activity {{APP}}/.MainActivity
  just dev