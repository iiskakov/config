#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR



#: DOTFILES {{{

#Vim & Neovim
rm ~/.vimrc 2>/dev/null || true
ln -s ${PWD}/nvim/vimrc ~/.vimrc
rm ~/.config/nvim/init.vim 2>/dev/null || true
ln -s ${PWD}/nvim/init.vim ~/.config/nvim/init.vim

#Yabai
rm ~/.yabairc 2>/dev/null || true
ln -s ${PWD}/yabai/yabairc ~/.yabairc

#kitty
rm ~/.config/kitty/kitty.conf 2>/dev/null || true
ln -s ${PWD}/kitty/kitty.conf ~/.config/kitty/kitty.conf 

#fish
rm ~/.config/fish/config.fish 2>/dev/null || true
ln -s ${PWD}/fish/config.fish  ~/.config/fish/config.fish

#Hammerspoon
rm ~/.hammerspoon/init.lua 2>/dev/null || true
ln -s ${PWD}/hammerspoon/init.lua ~/.hammerspoon/init.lua  

#Doom
rm ~/.doom.d/init.el 2>/dev/null || true
rm ~/.doom.d/config.el 2>/dev/null || true
rm ~/.doom.d/packages.el 2>/dev/null || true
ln -s ${PWD}/emacs/doom/init.el ~/.doom.d/init.el
ln -s ${PWD}/emacs/doom/config.el ~/.doom.d/config.el
ln -s ${PWD}/emacs/doom/packages.el ~/.doom.d/packages.el

#Maid
rm ~/.maid/rules.rb 2>/dev/null || true
ln -s ${PWD}/maid/rules.rb  ~/.maid/rules.rb

#Tmux
rm ~/.tmux.conf 2>/dev/null || true
ln -s ~/config/tmux/.tmux.conf  ~/.tmux.conf

#: }}}


#: VIM PLUGINS

#Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


#Install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree 

#Install Vim-Sensible
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible

#Install Lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim

#Base2Tone theme
git clone https://github.com/atelierbram/Base2Tone-vim.git ~/.vim/bundle/Base2Tone-vim

#Vim rooter
git clone https://github.com/airblade/vim-rooter ~/.vim/bundle/vim-rooter

#Fzf vim support
git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim

#Vim-matchup
git clone https://github.com/andymass/vim-matchup ~/.vim/bundle/vim-matchup

#Higlight yank
git clone https://github.com/machakann/vim-highlightedyank ~/.vim/bundle/vim-highlightedyank

#vim sneak 
git clone https://github.com/justinmk/vim-sneak ~/.vim/bundle/vim-sneak

#Fzf vim
git clone https://github.com/junegunn/fzf ~/.vim/bundle/fzf
~/.vim/bundle/fzf/install --bin
git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim

#Coc Intellisense
git clone https://github.com/neoclide/coc.nvim ~/.vim/bundle/coc.nvim
#: }}}
