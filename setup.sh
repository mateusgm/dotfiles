#!/bin/bash

git submodule update --init --recursive

for file in `ls files/`; do
  link="`pwd`/files/${file}"
  ln -sf $link ~/$file
  echo $link
done
