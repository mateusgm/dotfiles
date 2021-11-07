#!/bin/bash


for file in `find dotfiles -d 1 -exec basename {} \;`; do
  link="`pwd`/dotfiles/${file}"
  rm -rf ~/$file
  ln -sf $link ~/$file
  echo $link
done