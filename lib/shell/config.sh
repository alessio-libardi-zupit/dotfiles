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

if [ -n "$SSH_KEY" ]; then
  echo "Writing SSH key..."
  echo "$SSH_KEY" >~/.ssh/key
  chmod 600 ~/.ssh/key
fi

echo "Shell configured!"
