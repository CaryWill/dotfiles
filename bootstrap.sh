# 安装 rg
brew install neovim
brew install fzf # 安装 fzf 的话需要
brew install ripgrep # 安装 fzf 的话需要
brew install bat # 安装 fzf 的话需要
brew install the_silver_searcher # 安装 fzf 的话需要
#brew install fd # 安装 telescope 的话需要

# 安装字体
#brew tap homebrew/cask-fonts

# 设置软连接兼容 neovim
ln -sf ~/.vimrc ./.config/nvim/init.vim
ln -sf ~/.vim/.vimrc ./.config/nvim/init.vim
ln -sf ~/.vim ./.config/nvim
ln -sf ~/.config/nvim ./.config/nvim
ln -sf ~/.config/fish ./.config/fish
ln -sf ~/.zshrc ./.config/dotfiles/.zshrc
ln -sf ./.config/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ./.config/dotfiles/.bashrc ~/.bashrc 

# 安装 vim 插件
vim +PlugInstall +qall