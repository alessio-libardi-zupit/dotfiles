#!/usr/bin/env bash

echo "Configuring libraries..."
brew bundle --file=./lib/shell/Brewfile

sed -i '/^eval "$(starship init bash)"$/b; $a eval "$(starship init bash)"' ~/.bashrc

if [ "$(ps -p $$ -o 'comm=')" != "bash" ]; then
  echo "Changing default shell to $SHELL_PATH"

  SHELL_PATH="/opt/homebrew/bin/bash"
  grep -qxF "$SHELL_PATH" /etc/shells || echo "$SHELL_PATH" | sudo tee -a /etc/shells
  sudo chsh -s "$SHELL_PATH"
  exec "$SHELL_PATH"
fi

sed -i "s/export PATH=$HOME/bin:$PATH//g" ~/.bashrc

echo "$SSH_KEY" >~/.ssh/key
chmod 400 ~/.ssh/key

echo "Shell configured!"
