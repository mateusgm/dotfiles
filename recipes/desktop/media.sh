#!/bin/bash

media=( ubuntu-restricted-extras libdvdread4 vlc vlc-plugin-pulse )
files=( p7zip p7zip-full p7zip-rar )

sudo apt-get update
sudo apt-get install -y ${media[*]} ${files[*]}

sudo /usr/share/doc/libdvdread4/install-css.sh
