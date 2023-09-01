#!/bin/bash

# 安装 vim plugin 依赖
#brew install vim
#brew install ripgrep # 安装 fzf 的话需要
# brew tap daipeihust/tap && brew install im-select # 自动切换输入法

# neovim lsp
#npm install -g eslint_d prettier

# Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
# dotfiles
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
# Vim plugin manager

# 安装 vim 插件
vim +PlugInstall +qall
