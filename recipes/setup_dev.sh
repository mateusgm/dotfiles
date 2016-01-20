#!/bin/bash

#packages
libs=(build-essential autoconf automake curl pkg-config)
tools=(autojump vim git tmux htop filezilla ctags guake)

sudo apt-get install -y ${libs[*]} ${tools[*]}

#repos
sudo apt-add-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get install -y sublime-text

#virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get install virtualbox-4.3
sudo adduser $USER vboxusers

#zsh
sudo apt-get install -y zsh
curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

#ruby
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
gem install bundler
# echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile

#public-html
sudo rm -rf /var/www
sudo ln -s ~/desktop /var/www
