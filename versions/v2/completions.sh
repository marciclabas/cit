_complete() {
  COMPREPLY=()
  local cur=${COMP_WORDS[COMP_CWORD]}

  if [[ $COMP_CWORD -eq 1 ]]; then
    local recipes=$(cit --summary 2> /dev/null)
    COMPREPLY=( $(compgen -W "${recipes}" -- "${cur}") )
  elif [[ $COMP_CWORD -ge 2 ]]; then
    local module=${COMP_WORDS[1]}
    local modrecipes=$(just --summary --justfile $CIT_HOME/just/$module/Justfile 2> /dev/null)
    local query=$([[ $COMP_CWORD -eq 2 ]] && echo "" || echo $cur)
    COMPREPLY=( $(compgen -W "${modrecipes}" -- "$query") )
  fi
}

complete -F _complete cit