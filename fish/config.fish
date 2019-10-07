# External monitor padding
alias pad2 "yabai -m config --space 2 top_padding 160"

# Kitty autocomplete
kitty + complete setup fish | source

# vim = nvim 
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim" 

function ls
    exa -g1h $argv
end
