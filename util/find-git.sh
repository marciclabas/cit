find_git_root() {
  dir=$PWD
  while [ "$dir" != "/" ]; do
    if [ -d "$dir/.git" ]; then
      echo "$dir"
      return
    fi
    dir=$(dirname "$dir")
  done
  echo "No .git directory found up to /"
  exit 1
}
