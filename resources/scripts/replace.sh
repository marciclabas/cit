#!/bin/bash

# Check if enough arguments are provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 PATH FROM TO"
  exit 1
fi

# Assign arguments to variables
TARGET_DIR=$1
FROM=$2
TO=$3

echo "Target: $TARGET_DIR"

# Ensure the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory $TARGET_DIR does not exist."
    exit 1
fi

# Escape special characters in FROM and TO to avoid issues with sed
ESCAPED_FROM=$(echo "$FROM" | sed 's/[&/\]/\\&/g')
ESCAPED_TO=$(echo "$TO" | sed 's/[&/\]/\\&/g')

# Replace occurrences of FROM with TO in all files under the target directory
find "$TARGET_DIR" -type f -exec sed -i "s/$ESCAPED_FROM/$ESCAPED_TO/g" {} +
