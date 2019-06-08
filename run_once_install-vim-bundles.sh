#!/usr/bin/env bash

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "==> Installing vim bundles…"
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi