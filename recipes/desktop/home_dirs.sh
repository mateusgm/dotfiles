#!/bin/bash

BASE=/media/arquivos
DOTFILES=~/tools/dotfiles

# auto link

mkdir /media/arquivos
echo "UUID=52e510b0-7aab-4614-97bb-cfca71569189 /media/arquivos ext4    defaults        0       2" | sudo tee -a /etc/fstab 


# cleaning

for dir in `ls ~/`; do
  rm -rf ~/$dir
done


# folders 

for dir in `ls $BASE | grep -v 'configs'`; do
  ln -sf $BASE/$dir ~/$dir
done


# configs

for config in `ls $BASE/configs`; do
  ln -sf $BASE/configs/$config ~/.$config
done


# desktop

ln -sf ~/projects ~/desktop




