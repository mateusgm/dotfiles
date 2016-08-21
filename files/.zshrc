# oh my zsh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git tmux  autojump command-not-found bundler)

source $ZSH/oh-my-zsh.sh


# User configuration

export LANG=pt_BR.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# For a ipython notebook and pyspark integration
export SPARK_HOME="/usr/local/Cellar/apache-spark/2.0.0/libexec/"
export PYSPARK_SUBMIT_ARGS="--master local[2]"
