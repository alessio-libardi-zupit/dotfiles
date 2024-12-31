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

  # install ppp if not found
  if ! command -v pppd &>/dev/null; then
    echo "Installing ppp..."
    sudo apt-get install -y ppp
  fi

  if [ "$config" = "office" ]; then
    sudo env "PATH=$PATH" openfortivpn -c "$HOME/.vpn/${config}.conf" -u "$VPN_OFFICE_USERNAME" -p "$VPN_OFFICE_PASSWORD"
  elif [ "$config" = "apss" ]; then
    sudo env "PATH=$PATH" openfortivpn -c "$HOME/.vpn/${config}.conf" -u "$VPN_APSS_USERNAME" -p "$VPN_APSS_PASSWORD"
  else
    echo "Unknown VPN configuration: $config"
    return 1
  fi
}
