# declare -A cit_completions

# # Path to the config file
# CONFIG_FILE="./completions.conf"

# # Check if the config file exists
# if [ -f "$CONFIG_FILE" ]; then
#   while IFS='=' read -r key value; do
#     echo "Reading $key $value"
#     cit_completions["$key"]="$value"
#   done < $CONFIG_FILE
# else
#   echo "Config file not found: $CONFIG_FILE"
#   exit 1
# fi

_cit_autocomplete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  # Example logic for autocompletion - adjust as needed
  if [[ -v cit_completions[$prev] ]]; then
    local dir="${cit_completions[$prev]}"
    COMPREPLY=( $(compgen -W "$(bash ./completions/cit-completion.sh "$dir")" -- ${cur}) )
    return 0
  fi
  # Default to justfile targets for other cases
  COMPREPLY=( $(compgen -W "$(just --summary)" -- ${cur}) )
}

source ./completions/parse-config.sh completions.conf
complete -F _cit_autocomplete cit
alias cit="just --justfile ./Justfile --working-directory ."
