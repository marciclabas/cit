export CIT_BASE=$(dirname "${BASH_SOURCE[0]}")
source $CIT_BASE/versions/v2/source.sh

export BUMP="$CIT_BASE/resources/scripts/bump.sh"
export FIND_LAN_IP="$CIT_BASE/resources/scripts/find_lan_ip.sh"
export FIND_ANDROID_DEVICE="$CIT_BASE/resources/scripts/find_android_device.sh"
alias ADB="powershell.exe adb"
