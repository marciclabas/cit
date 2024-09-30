titlecase() {
  echo "$1" | awk '{ print toupper(substr($0,1,1)) tolower(substr($0,2)) }'
}

snakecase() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/_/g'
}
