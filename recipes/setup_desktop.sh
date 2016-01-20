#!/bin/bash

# packages
media=(ubuntu-restricted-extras libdvdread4 vlc vlc-plugin-pulse kazam)
files=(p7zip p7zip-full p7zip-rar)
web=(google-chrome-stable oracle-java8-installer skype nemo-dropbox)
laptop=(tlp preload alacarte wmctrl bum conky-all)

# repo

sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:kazam-team/stable-series
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google.list

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
echo "deb http://linux.dropbox.com/ubuntu/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/dropbox.list

# install
sudo apt-get update
sudo apt-get install -y ${media[*]} ${files[*]} ${web[*]} ${laptop[*]}
sudo apt-get autoremove && sudo apt-get autoclean
sudo apt-get upgrade -y

# setup
sudo /usr/share/doc/libdvdread4/install-css.sh
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
