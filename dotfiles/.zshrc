# Path to your oh-my-zsh installation.
export ZSH="/Users/cary/.oh-my-zsh"
ZSH_THEME=""

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Auto suggestion 
bindkey '^ ' autosuggest-accept

export PATH="$PATH:"/usr/local/bin/
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH=/usr/local/go
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/homebrew/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

TERM="xterm" #防止删除键变成空格键
export LANG=en_US.UTF-8
alias vim=nvim
export VISUAL=nvim
alias python=python3
alias tsnode=ts-node
export TERM=xterm-256color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
# 用当前文件夹名直接创建一个 tmux session
alias 'tmux-s'='tmux new -s ${PWD##*/}'

# for nested tmux
# unset TMUX
