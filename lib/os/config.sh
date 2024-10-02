#!/usr/bin/env bash

echo "Configuring applications..."
brew bundle --file=./lib/os/Brewfile

case $(uname -s) in
Darwin)
  bash ./lib/os/mac/config.sh
  ;;
Linux)
  bash ./lib/os/linux/config.sh
  ;;
*) ;;
esac
