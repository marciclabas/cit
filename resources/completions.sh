_complete() {

  local binary=${COMP_WORDS[0]} # cit or just

  COMPREPLY=()
  local cur=${COMP_WORDS[COMP_CWORD]}

  local allrecipes=$([ $binary == "cit" ] && cit --summary 2>/dev/null || just --summary 2>/dev/null)

  if [[ $COMP_CWORD -eq 1 ]]; then
    local recipes=$(echo $allrecipes \
      | tr ' ' '\n' \
      | cut -d ':' -f 1 \
      | uniq \
    )
    COMPREPLY=( $(compgen -W "${recipes}" -- "${cur}") )
  elif [[ $COMP_CWORD -eq 2 ]]; then
    local module=${COMP_WORDS[1]}
    local modrecipes=$(echo $allrecipes \
      | tr ' ' '\n' \
      | grep "$module::$cur" \
      | cut -d ':' -f 3
    )
    if [[ -n $modrecipes ]]; then
      COMPREPLY=( $(compgen -W "${modrecipes}" -- "$cur") )
    else
      compopt -o filenames
      COMPREPLY=( $(compgen -d -- "${cur}") )
    fi
  else
      compopt -o filenames
      COMPREPLY=( $(compgen -d -- "${cur}") )
  fi
}

complete -F _complete cit
complete -F _complete just