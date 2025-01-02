#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "Setting dock..."

  if [ ! -f /usr/local/bin/dockutil ]; then
    dockutil --no-restart --remove all
    dockutil --no-restart --add "/Applications/Launchpad.app"

    dockutil --add '' --type small-spacer --section apps --before Arc

    dockutil --no-restart --add "/Applications/Arc.app"
    dockutil --no-restart --add "/Applications/Kitty.app"
    dockutil --no-restart --add "/Applications/Visual Studio Code.app"

    killall Dock

    echo "Success! Dock is set."
  fi
else
  echo "Not on macOS. Exiting..."
  exit 0
fi
