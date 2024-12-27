#!/usr/bin/env bash
set -e

# Usage: git-open <branch-name> <commit-message>
if [ $# -ne 2 ]; then
  echo "Usage: $0 <branch-name> <commit-message>"
  return 1
fi

BRANCH="$1"
COMMIT_MESSAGE="$2"

git main
git checkout -b "$BRANCH"
git commit --allow-empty -m "$COMMIT_MESSAGE"
git push -u origin "$BRANCH"

gh pr create --title "$COMMIT_MESSAGE" --assignee "@me" -b '' --draft
