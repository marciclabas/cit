#!/bin/bash

# Check if a directory path is provided
if [ $# -eq 0 ]; then
  echo "[!] No directory provided"
  exit 1
fi

# The first argument is the directory path
DIR_PATH="$1"

# Ensure the directory exists
if [ ! -d "${DIR_PATH}" ]; then
  echo "[!] Directory does not exist: '${DIR_PATH}'"
  exit 1
fi

# Loop through all items in the directory
for item in "${DIR_PATH}"/*; do
  if [ -d "${item}" ]; then
    basename "${item}"
  fi
done
