#!/usr/bin/env bash

# shellcheck source=lib/shell/config/.bashrc
source ~/.bashrc

if ! command -v brew &>/dev/null; then
  echo "Installing package manager..."
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Detecting OS..."

case $(uname -s) in
Darwin)
  if ! command -v brew &>/dev/null; then
    MACOS_PACKAGE_MANAGER_PATH="/opt/homebrew/bin/brew"
    echo "eval \"sudo -Hu alessiolibardi \$(${MACOS_PACKAGE_MANAGER_PATH} shellenv)\"" >> ~/.bashrc
    eval "sudo -Hu alessiolibardi $(${MACOS_PACKAGE_MANAGER_PATH} shellenv)"
    source ~/.bashrc
  fi
  bash ./lib/os/mac/config.sh
  ;;
Linux)
  if ! command -v brew &>/dev/null; then
    LINUX_PACKAGE_MANAGER_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
    echo "eval \"\$(${LINUX_PACKAGE_MANAGER_PATH} shellenv)\"" >> ~/.bashrc
    eval "$(${LINUX_PACKAGE_MANAGER_PATH} shellenv)"
    source ~/.bashrc
  fi
  bash ./lib/os/linux/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  ;;
esac
