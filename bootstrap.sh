#!/bin/bash

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/.nvim/.directory
mkdir -p ~/.vim/.nvim/.undo
mkdir -p ~/.vim/.nvim/.backup

# 管理 neovim 的版本
brew install bob
# 安装 vim plugin 依赖
brew install neovim --HEAD
brew install ripgrep # 安装 fzf 的话需要
brew tap daipeihust/tap && brew install im-select # 自动切换输入法
brew install bat
brew install ripgrep
brew install fzf
brew install reattach-to-user-namespace

# 如果是 neovim 的话，那么需要改一下位置，在 ~/.config/nvim/autoload/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim lsp
npm install -g eslint_d prettier

# 如果这里保留了 vim 和 nvim 的配置位置
# 可以通过 zshrc 里面添加 alias 来进行配置决定使用 vim 还是 nvim
# 设置软连接兼容 neovim
ln -sf "$(pwd)/.config/nvim" ~/.config
ln -sf "$(pwd)/.config/nvim/.vimrc" ~/.vim/.vimrc
ln -sf "$(pwd)/.config/nvim/.vimrc" ~/.vimrc
# dotfiles
ln -sf "$(pwd)/dotfiles/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/dotfiles/.bashrc" ~/.bashrc
ln -sf "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -sf "$(pwd)/coc-settings.json" ~/.vim/coc-settings.json

# 安装 vim 插件
vim +PlugInstall +qall
