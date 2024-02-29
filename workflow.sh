#!/bin/bash

source /home/m4rs/cit/util/find-git.sh

BASE=$(find_git_root)

FOLDER=$1
TEMPLATE="/home/m4rs/cit/templates/deploy.yml"
OUTPUT="$BASE/.github/workflows/deploy-$FOLDER.yml"

if [[ ! -d "$BASE/$FOLDER" ]]; then
  echo "ERROR: $BASE/$FOLDER doesn't exist"
  exit 1
fi

mkdir -p $(dirname $OUTPUT)
sed "s/{{DIRECTORY}}/${FOLDER}/g" $TEMPLATE > $OUTPUT
echo "$OUTPUT" workflow file created successfully!