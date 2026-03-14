#!/bin/bash

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

rm ~/.tmux.conf
ln -s `pwd`/dotfiles/.tmux.mac ~/.tmux.conf

brew install \
  autojump \
  tmux \
  docker
