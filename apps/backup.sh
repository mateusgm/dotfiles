#!/usr/bin/env bash

rsync -Crvazu --delete \
  --exclude=docker/ \
  --exclude=thunderbird/ \
  --exclude=Personalizadas/ \
  --exclude=configs/ \
  --exclude=entertainment/ \
  --exclude=android-sdk-linux/ \
  --exclude=node_modules/ \
  --exclude=cache/ \
  --exclude=tmp/ \
  --exclude=bundle/ \
  --exclude=*.crdownload \
  --exclude=.Trash-1000/ \
  /media/arquivos/ /media/mateus/4E0D13D72588E118/Mateus/
