#!/bin/bash

find_android_device() {
  local device=$(powershell.exe adb devices -l | dos2unix | awk 'NR==2{print $1}')
  echo $device
}

find_android_device