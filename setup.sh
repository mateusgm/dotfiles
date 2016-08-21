#!/bin/bash

git submodule update --init --recursive

for file in `find files/ -type f | grep -v .git^`; do
	link="`pwd`/${file}"
  dir=`basename $(dirname $file) | grep -v files`
  if [ -f $dir ]
  then
    ln -sf $link ~/.`basename $file`
  else  
    ln -sf $link ~/.$dir/`basename $file`
  fi
  echo $link
done
