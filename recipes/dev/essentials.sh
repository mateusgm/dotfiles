#!/bin/bash

essentials=( build-essential curl autoconf automake curl pkg-config )
tools=( autojump zsh vim git tmux htop ctags )
libs=( libtool libreadline6 libreadline6-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev libc6-dev ncurses-dev zlib1g zlib1g-dev )

sudo apt-get install -y ${libs[*]} ${tools[*]} ${essentials[*]}

