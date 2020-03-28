# dotfiles
  Synced with [gbck](https://github.com/jukben/gbck)

## Something to notice

### 1. install vim plugins

> vim

> :PlugClean

> :PlugInstall

### 2. Other issues

#### 2.1 Exception not caught: [vim-hug-neovim-rpc] requires one of `:pythonx import [pynvim|neovim]` command to work

> python2.7 -m ensurepip --default-pip
> python2 -m pip install pynvim --user

#### 2.2 Install powerline font

##### set iterm2 normal font to powerline font

##### https://github.com/powerline/fonts

#### 2.3 Nerd tree font missing

##### set iterm2 non-ascii to nerd tree font 

> brew tap homebrew/cask-fonts
> brew cask install font-hack-nerd-font