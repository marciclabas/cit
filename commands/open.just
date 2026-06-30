# Show this message
help:
  @echo "Usage: 'cit open <repo-name>' to quickly open a dev environment"
  @just --list --justfile open.just

# Open cit
cit:
  @ echo Opening $CIT_HOME
  code $CIT_HOME

