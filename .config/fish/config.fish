if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /usr/local/bin $PATH

set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.rvm/bin $PATH

# Android
set -g ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $ANDROID_HOME $PATH
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH

# NVM
set -g NVM_DIR $HOME/.nvm
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

# 默认使用 nvim
alias vim="nvim"
alias python='python3'
