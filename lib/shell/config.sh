#!/usr/bin/env bash

echo "Configuring libraries..."
brew bundle --file=./lib/shell/Brewfile

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then
  echo "Changing default shell to $SHELL_PATH"

  SHELL_PATH="/opt/homebrew/bin/bash"
  grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells
  sudo chsh -s "$SHELL_PATH"
  exec "$SHELL_PATH"
fi

echo "$SSH_KEY" >~/.ssh/key
chmod 400 ~/.ssh/key

echo "Shell configured!"
