# Path to your oh-my-zsh installation.
export ZSH="/Users/cary/.oh-my-zsh"
ZSH_THEME="ys"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Auto suggestion 
bindkey '^ ' autosuggest-accept

# 默认使用 nvim
alias vim=nvim
alias python=python3

export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH=$HOME/go
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/homebrew/bin
export PATH="$PATH:/usr/local/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

TERM="xterm" #防止删除键变成空格键
export LANG=en_US.UTF-8
#Use Neovim as preferred editor
export VISUAL=nvim
# Use Neovim instead of Vim
alias vim=nvim
