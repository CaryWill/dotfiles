# Path to your oh-my-zsh installation.
export ZSH="/Users/cary/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
ZSH_THEME="fishy"

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
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:/opt/homebrew/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://github.com/neovim/neovim/issues/13734#issuecomment-758357517
export TERM="xterm-kitty"
# export TERM="xterm-256color"
export LANG=en_US.UTF-8
export TERM_ITALICS=true
alias vim=nvim
# export VISUAL="nvim -u NORC"
export VISUAL="nvim"

# 用当前文件夹名直接创建一个 tmux session
# 用当前文件夹名和父目录直接创建一个 tmux session
alias 'tx'='tmux new-session -s "$(basename $(dirname $(pwd)))/$(basename $(pwd))"'
alias 'ta'='tmux attach'
alias 'aidc'='cd ~/workspace/aidc-xspace'
# alias 'org'='cd "/Users/cary/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/"'
# alias backup='"/Users/cary/workspace/github/dotfiles/dotfiles/backup_script.sh"'

# change `clean` zsh theme to full path
# export PATH="/opt/procursus/bin:/opt/procursus/sbin:/opt/procursus/games:$PATH"
# export CPATH="$CPATH:/opt/procursus/include"
# export LIBRARY_PATH="$LIBRARY_PATH:/opt/procursus/lib"
# export PATH="/opt/procursus/bin:/opt/procursus/sbin:/opt/procursus/games:$PATH"
# export CPATH="$CPATH:/opt/procursus/include"
# export LIBRARY_PATH="$LIBRARY_PATH:/opt/procursus/lib"

# disable zsh update
# DISABLE_UPDATE_PROMPT=true
# stop brew downloading the formula each time when using services command
# export HOMEBREW_NO_INSTALL_FROM_API=1
# speed up downloading
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export CRYPTO_DIR=$(brew --prefix openssl) 
# export OPENSSL_DIR=$(brew --prefix openssl)
# export LIBEV_DIR=$(brew --prefix libev)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home"

# emacs colors
# export COLORTERM=truecolor
