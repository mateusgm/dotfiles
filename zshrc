# oh my zsh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git tmux tmuxinator autojump command-not-found bundler npm)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=pt_BR.UTF-8
export PATH=${PATH}:"/usr/local/Trolltech/Qt-4.8.6/bin"
export PATH=${PATH}:"$HOME/tools/elastic-beanstalk/eb/linux/python2.7"
export PATH=${PATH}:"$HOME/tools/android-sdk-linux/platform-tools:$HOME/tools/android-sdk-linux/tools"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

