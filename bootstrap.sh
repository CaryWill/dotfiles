#!/bin/bash

# 安装 vim plugin 依赖
brew install neovim --HEAD
brew install ripgrep # 安装 fzf 的话需要
brew tap daipeihust/tap && brew install im-select # 自动切换输入法

# neovim lsp
npm install -g eslint_d prettier

# 设置软连接兼容 neovim
ln -sf "$(pwd)/.config/nvim" ~/.config
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.vim/.vimrc
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.vimrc
# dotfiles
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "$(pwd)/dotfiles/.p10k.zsh " ~/.p10k.zsh

# 安装 vim 插件
vim +PlugInstall +qall
