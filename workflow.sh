#!/bin/bash

source /home/m4rs/cit/util/find-git.sh

BASE=$(find_git_root)

FOLDER=${1:-.}
if [ -z $1 ]; then
  ACTION="deploy"
else
  echo Not empty!?
  ACTION="deploy-$FOLDER"
fi

echo "FOLDER: $FOLDER, ACTION: $ACTION, 1: $1"

TEMPLATE="/home/m4rs/cit/templates/deploy.yml"
OUTPUT="$BASE/.github/workflows/$ACTION.yml"

if [[ ! -d "$BASE/$FOLDER" && -n $FOLDER ]]; then
  echo "ERROR: $BASE/$FOLDER doesn't exist"
  exit 1
fi

mkdir -p $(dirname $OUTPUT)
sed "s/{{DIRECTORY}}/${FOLDER}/g" $TEMPLATE > $OUTPUT
echo "$OUTPUT" workflow file created successfully!
echo "Adding '$ACTION' rule to $BASE/Justfile"
echo "" >> $BASE/Justfile
echo "# Deploy '$FOLDER' into GitHub Pages" >> $BASE/Justfile
echo "$ACTION:" >> $BASE/Justfile
echo "  gh workflow run $ACTION.yml --ref main" >> $BASE/Justfile