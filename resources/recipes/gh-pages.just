# Publish to gh-pages
gh-pages PATH='dist':
  @ git_root=$(git rev-parse --show-toplevel) && \
  path=$(realpath --relative-to=$git_root {{PATH}}) && \
  echo "Pushing $path" && \
  cd $git_root && \
  git subtree push --prefix $path origin gh-pages || \
  git push origin `git subtree split --prefix $path main`:gh-pages --force