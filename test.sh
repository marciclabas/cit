echo $(just --justfile versions/v2/just/Justfile --summary \
  | tr ' ' '\n' \
  | grep add \
  | cut -d ':' -f 3
)