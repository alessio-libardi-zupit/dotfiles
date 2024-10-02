#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "Setting dock..."

  if [ ! -f /usr/local/bin/dockutil ]; then
    dockutil --no-restart --remove all

    dockutil --no-restart --add "/Applications/Arc.app"
    dockutil --no-restart --add "/Applications/Terminal.app"
    dockutil --no-restart --add "/Applications/Visual Studio Code.app"

    dockutil --add '' --type spacer --section apps --before Arc

    killall Dock

    echo "Success! Dock is set."
  fi
else
  echo "Not on macOS. Exiting..."
  exit 0
fi
