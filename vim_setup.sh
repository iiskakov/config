#!/bin/bash

#Install pythogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#Install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree 

#Install Vim-Sensible
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible

#Install Lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
