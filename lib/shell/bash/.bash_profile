eval "$(keychain --eval --agents ssh id_rsa)"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
