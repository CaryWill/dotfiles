#!/bin/bash

# 1. vim fzf
brew install bat
brew install ripgrep
brew install fzf

# 2. tmux copy
brew install reattach-to-user-namespace

# 3. input source 
# Install Squirrel Input source(we can switch input sources using 
# `shift` command
# https://zhyq118.com/2018/11/11/%E9%BC%A0%E9%A1%BB%E7%AE%A1%E6%8C%82%E6%8E%A5%E5%B0%8F%E9%B9%A4%E5%8F%8C%E6%8B%BC/
# brew install --cask squirrel
# install xiaohe source
# curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install | bash
# cd plum
# bash rime-install double-pinyin
# cd ..
# manually click Squirrel's deploy button in the menu bar

# 4. vim's backup directory
mkdir -p ~/.vim/tmp

# 5. install Vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 6. install cargo
curl https://sh.rustup.rs -sSf | sh

# 6. Sync vimrc
ln -sf "$(pwd)/.config/vim/.vimrc" ~/.vimrc
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "$(pwd)/coc-settings.json" ~/.vim/coc-settings.json
#ln -sf "$(pwd)/.config/com.apple.Terminal.plist" ~/Library/Preferences/com.apple.Terminal.plist
# ln -sf "$(pwd)/rime/default.custom.yaml" ~/Library/Rime/default.custom.yaml
# ln -sf "$(pwd)/rime/squirrel.custom.yaml" ~/Library/Rime/squirrel.custom.yaml

# 7. 安装 vim 插件
vim +PlugInstall +qall

