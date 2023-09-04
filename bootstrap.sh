#!/bin/bash

brew install bat
brew install ripgrep
brew install fzf

mkdir -p ~/.vim/tmp

# Vim plugin manager

# Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "$(pwd)/coc-settings.json" ~/.vim/coc-settings.json

# 安装 vim 插件
vim +PlugInstall +qall

