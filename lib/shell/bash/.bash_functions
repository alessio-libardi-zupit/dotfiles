git_main() {
  set -e

  git checkout main
  git pull
}

git_draft() {
  # Use: git-draft <branch-name> <commit-message>
  if [ $# -ne 2 ]; then
    echo "Usage: git-draft <branch-name> <commit-message>"
    return 1
  fi

  local BRANCH="$1"
  local COMMIT_MESSAGE="$2"

  set -e

  git_main

  git checkout -b "$BRANCH"
  git commit --allow-empty -m "$COMMIT_MESSAGE"
  git push -u origin "$BRANCH"

  gh pr create \
    --fill \
    --assignee "@me" \
    --web
}

vpn_easy() {
  local config="$1"
  if [ -z "$config" ]; then
    echo "Usage: vpn <office|apss>"
    return 1
  fi

  sudo env "PATH=$PATH" openfortivpn -c "$HOME/.vpn/${config}.conf"
}
