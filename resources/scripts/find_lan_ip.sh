#!/bin/bash

find_lan_ip() {
  local ip_addr=$(powershell.exe ipconfig | dos2unix | grep 192.168.1 | head -1 | rev | cut -d ' ' -f 1 | rev)
  echo "$ip_addr"
}

echo `find_lan_ip`
