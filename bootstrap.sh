#!/bin/bash

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/.nvim/.directory
mkdir -p ~/.vim/.nvim/.undo
mkdir -p ~/.vim/.nvim/.backup

# 安装 vim plugin 依赖
brew install neovim --HEAD
brew install ripgrep # 安装 fzf 的话需要
#brew install fd
brew tap daipeihust/tap && brew install im-select # 自动切换输入法
# brew install bat
# brew install fzf
#brew install reattach-to-user-namespace
#brew install stylua
# for export org file to other format
#brew install emacs
# brew install --cask emacs
brew install pandoc
# you need install it to make it work with
# 3rd/image neovim plugin
brew install imagemagick
# telescope image preview
brew install chafa
# telescope smart-open.nvim
#brew install sqlite3
# telekasten
#brew install catimg
#brew install viu
#brew install xclip
# brew install meson

# language tool
# since grammarly is not work anymore
# for developers
# so, install zulu21 and configure java home
# to make it work
#brew install --cask zulu21

# nodejs plugin for neovim
# https://github.com/neovim/node-client
#npm install -g neovim

# 如果是 neovim 的话，那么需要改一下位置，在 ~/.config/nvim/autoload/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim lsp
# npm install -g eslint_d 
npm install -g prettier
# npm install -g @fsouza/prettierd
# default lsp if your project dont have ts as dependency
# then use the global one
npm install -g typescript typescript-language-server
npm install -g eslint
# grammar
#npm install -g write-good
#npm i -g grammarly-languageserver

# jest related
#npm install -g jest 
#npm install -g ts-node
#npm install -g ts-jest

# 如果这里保留了 vim 和 nvim 的配置位置
# 可以通过 zshrc 里面添加 alias 来进行配置决定使用 vim 还是 nvim
# 设置软连接兼容 neovim
ln -sf "$(pwd)/.config/nvim" ~/.config
ln -sf "$(pwd)/.config/nvim/.vimrc" ~/.vim/.vimrc
ln -sf "$(pwd)/.config/nvim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.config/nvim" ~/.vim
# dotfiles
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
#ln -sf "$(pwd)/coc-settings.json" ~/.vim/coc-settings.json
# kitty config
ln -s "$(pwd)/.config/kitty" ~/.config
ln -s "$(pwd)/.config/emacs/init.el" ~/.config/emacs

# how to install neovim nightly
#1. download the file from github
#https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-download
#2. chmod u+x nvim
#3. sudo mv nvim $(which nvim)

# add emacs non-standard strikethrough
tic -x xterm-256color.ti

# 安装 vim 插件
vim +PlugInstall +qall
