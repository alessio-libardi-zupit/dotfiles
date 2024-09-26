#!/usr/bin/env bash

echo "Configuring MacOS..."

echo "Installing Homebrew..."
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Configuring applications & libraries..."
brew bundle

echo "MacOS configured!"
