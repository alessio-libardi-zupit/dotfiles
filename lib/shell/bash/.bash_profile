eval "$(keychain --eval --agents ssh key)"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
