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


#: }}}


#: VIM PLUGINS

#Install pythogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim



###########

#Install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree 

#Install Vim-Sensible
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible

#Install Lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim

#Base2Tone theme
git clone https://github.com/atelierbram/Base2Tone-vim.git ~/.vim/bundle/Base2Tone-vim

#: }}}