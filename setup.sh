#!/bin/bash

git submodule update --init --recursive
./bin/link-dotfiles
./recipes/mac.sh
./recipes/oh-my-zsh.sh
