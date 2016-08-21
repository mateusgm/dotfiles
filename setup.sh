#!/bin/bash

git submodule update --init --recursive

for file in `ls -a files/`; do
  link="`pwd`/files/${file}"
  ln -sf $link ~/$file
  echo $link
done
