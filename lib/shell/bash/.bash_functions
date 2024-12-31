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

  if [ ! -f "$HOME/.vpn/${config}.conf" ]; then
    echo "VPN configuration file not found: $HOME/.vpn/${config}.conf"
    return 1
  fi

  if ! command -v pppd &>/dev/null; then
    sudo apt-get update > /dev/null
    sudo apt-get install -y ppp > /dev/null
    sudo apt-get install -y pppd > /dev/null
  fi

  CONF=$(mktemp)
  envsubst < "$HOME/.vpn/${config}.conf" > "$CONF"
  sudo env "PATH=$PATH" openfortivpn -c "$CONF"
}
