#!/bin/bash

# 1. update homebrew
brew update

# 2. compile vim with lua & python3 support
brew install lua
brew install python

# 3. In case Vim was already installed
cd src
sudo make distclean
cd ..

sudo ./configure \
--enable-luainterp=yes \
--enable-python3intern \
--with-lua-prefix=/opt/homebrew/bin \
--with-features=huge \
--enable-largefile \
--with-python3-command=python3 \
--enable-fail-if-missing \

sudo make && sudo make install

# Reinstall Vim with the modified formula, using the -s flag to build Vim from source
brew uninstall vim
brew edit vim
brew install -s vim
#brew install vim
#brew install ripgrep # 安装 fzf 的话需要
# brew tap daipeihust/tap && brew install im-select # 自动切换输入法

# Lsp
#npm install -g eslint_d prettier
npm install -g typescript-language-server

# Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc

# Vim plugin manager

# 安装 vim 插件
vim +PlugInstall +qall

