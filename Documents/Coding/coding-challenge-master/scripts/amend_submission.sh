#!/bin/bash

source "$(dirname $BASH_SOURCE)/shared.sh"

if [ ! -f "$ROOT/.id" ]; then
  say "What is your Submission ID?"
  read id
  echo $id > "$ROOT/.id"
fi

source "$ROOT/scripts/package_submission.sh"

git checkout $id
git add "$file.enc" "$ROOT/keys/$id.key.enc"
git commit --author "$git_author" -m "Amend submission $id"
git push origin $id
