#!/bin/bash

# Vim plugin manager

# Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "/Users/cary/workspace/github/dotfiles/coc-settings.json" ~/.vim/coc-settings.json

# 安装 vim 插件
vim +PlugInstall +qall

