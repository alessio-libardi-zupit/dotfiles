alias root='cd /'
alias home='cd ~'
alias editor='nvim'
alias ide='code'

alias update='bash ~/.config/dotfiles/bin/update.sh'

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/key
