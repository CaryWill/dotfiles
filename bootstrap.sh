#!/bin/bash

# 安装 vim plugin 依赖
brew install neovim
brew install fzf # 安装 fzf 的话需要
brew install ripgrep # 安装 fzf 的话需要
brew install bat # 安装 fzf 的话需要
brew install the_silver_searcher # 安装 fzf 的话需要
brew install fish # fish shell
#brew install fd # 安装 telescope 的话需要

# 安装字体
#brew tap homebrew/cask-fonts

# 设置软连接兼容 neovim
ln -sf "$(pwd)/.config/nvim" ~/.config
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.vim/.vimrc
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.vimrc
# dotfiles
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc

# 安装 vim 插件
vim +PlugInstall +qall

# oh my fish
# 自行安装下 fish git 插件
rm -rf "$(pwd)/../../../.local/share/omf"
rm -rf "$(pwd)/../../../.config/fish"
rm -rf "$(pwd)/../../../.config/omf"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

