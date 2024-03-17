HERE="/home/m4rs/cit"

_cit_autocomplete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  # Example logic for autocompletion - adjust as needed
  if [[ -v cit_completions[$prev] ]]; then
    local dir="${cit_completions[$prev]}"
    COMPREPLY=( $(compgen -W "$(bash $HERE/completions/cit-completion.sh $dir)" -- ${cur}) )
    return 0
  fi
  # Default to justfile targets for other cases
  COMPREPLY=( $(compgen -W "$(just --justfile $HERE/Justfile --summary)" -- ${cur}) )
}

source $HERE/completions/parse-config.sh $HERE/completions.conf
complete -F _cit_autocomplete cit
alias cit="just --justfile  $HERE/Justfile --working-directory ."
