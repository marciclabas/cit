export CIT_HOME=$(dirname "${BASH_SOURCE[0]}")

export JUST_UNSTABLE="true"
alias cit="just --justfile $CIT_HOME/commands/cit.just"

export CIT_SCRIPTS="$CIT_HOME/resources/scripts"

source $CIT_HOME/resources/completions.sh
