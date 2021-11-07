#!/bin/bash

git submodule update --init --recursive

for file in `find dotfiles -d 1 -exec basename {} \;`; do
  link="`pwd`/dotfiles/${file}"
  rm -rf ~/$file
  ln -sf $link ~/$file
  echo $link
done
