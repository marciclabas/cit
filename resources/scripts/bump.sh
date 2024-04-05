#!/bin/bash

# Dead simple script to bump the version of a .toml file
# Format: version = "0.0.0"

if [[ -z "$1" ]]; then
  echo "Error: missing path"
  echo "Usage: $0 path/to/pyproject.toml"
  exit 1
fi

PYPROJECT=$1

bump() {
  echo $1 | awk -F '.' '{print $1 "." $2 "." $3+1}'
}

extract() {
  echo $(grep "version =" $1 | sed 's/.*"\(.*\)"/\1/')
}

curr=$(extract $PYPROJECT)
newver=$(bump $curr)
sed -i "s/version = \".*\"/version = \"$newver\"/" $PYPROJECT

echo $newver