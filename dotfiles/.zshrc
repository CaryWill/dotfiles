# Path to your oh-my-zsh installation.
export ZSH="/Users/cary/.oh-my-zsh"
ZSH_THEME="robbyrussell"

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
export TERM_ITALICS=true
export TERM=xterm-256color
alias vim=nvim
export VISUAL=nvim
#alias python=python3
#alias tsnode=ts-node
# 用当前文件夹名直接创建一个 tmux session
# alias 'tmux-s'='tmux new -s ${PWD##*/}'
# 用当前文件夹名和父目录直接创建一个 tmux session
alias 'tmux-s'='tmux new-session -s "$(basename $(dirname $(pwd)))/$(basename $(pwd))"'
alias 'tx'='tmux-s'
alias 'ta'='tmux attach'
alias 'aidc'='cd ~/workspace/aidc-xspace'

# for nested tmux
# unset TMUX
# change `clean` zsh theme to full path
export PATH="/opt/procursus/bin:/opt/procursus/sbin:/opt/procursus/games:$PATH"
export CPATH="$CPATH:/opt/procursus/include"
export LIBRARY_PATH="$LIBRARY_PATH:/opt/procursus/lib"
export PATH="/opt/procursus/bin:/opt/procursus/sbin:/opt/procursus/games:$PATH"
export CPATH="$CPATH:/opt/procursus/include"
export LIBRARY_PATH="$LIBRARY_PATH:/opt/procursus/lib"

# bun completions
[ -s "/Users/cary/.bun/_bun" ] && source "/Users/cary/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
# disable zsh update
DISABLE_UPDATE_PROMPT=true
# stop brew downloading the formula each time when using services command
export HOMEBREW_NO_INSTALL_FROM_API=1

# dev
# usage: xp xspace/component-case-view
xp() {
  local param="$1"
  local output="https://code.alibaba-inc.com/${param}"
  open "$output"
}

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
