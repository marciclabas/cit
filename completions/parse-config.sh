declare -A cit_completions

CONFIG_FILE="$1"

if [ -f "$CONFIG_FILE" ]; then
  while IFS='=' read -r key value; do
    cit_completions["$key"]="$value"
  done < "$CONFIG_FILE"
else
  echo "Config file not found: $CONFIG_FILE"
  exit 1
fi
