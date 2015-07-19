#!/usr/bin/env bash

rsync -Crvazu --delete \
  --exclude=docker/ \
  --exclude=Personalizadas/ \
  --exclude=configs/ \
  --exclude=android-sdk-linux/ \
  --exclude=node_modules/ \
  --exclude=cache/ \
  --exclude=tmp/ \
  --exclude=bundle/ \
  /media/arquivos/ /media/mateus/4E0D13D72588E118/Mateus/
