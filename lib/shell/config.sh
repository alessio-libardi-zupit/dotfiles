#!/usr/bin/env bash

echo "Configuring libraries..."
brew bundle --file=./lib/shell/Brewfile

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then
  SHELL_PATH="/opt/homebrew/bin/bash"
  echo "Changing default shell to $SHELL_PATH"

  grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells
  sudo chsh -s "$SHELL_PATH"
  exec "$SHELL_PATH"
fi

if [ -n "$SSH_PRIVATE_KEY" ] && [ -n "$SSH_PUBLIC_KEY" ]; then
  echo "Writing SSH key pair..."
  echo "$SSH_PRIVATE_KEY" >~/.ssh/key
  chmod 600 ~/.ssh/key
  echo "$SSH_PUBLIC_KEY" >~/.ssh/key.pub
  chmod 644 ~/.ssh/key.pub
fi

echo "Shell configured!"
