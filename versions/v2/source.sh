export CIT_HOME=$(dirname "${BASH_SOURCE[0]}")
export JUST_UNSTABLE="true"
alias cit="just --justfile $CIT_HOME/just/Justfile"

source $CIT_HOME/completions.sh