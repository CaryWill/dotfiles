#!/bin/bash

#brew install bat
#brew install ripgrep
#brew install fzf
#brew install trash
#brew install reattach-to-user-namespace

mkdir -p ~/.vim/tmp

# Vim plugin manager

# Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "$(pwd)/coc-settings.json" ~/.vim/coc-settings.json
#ln -sf "$(pwd)/.config/com.apple.Terminal.plist" ~/Library/Preferences/com.apple.Terminal.plist

# 安装 vim 插件
vim +PlugInstall +qall

