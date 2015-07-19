#!/bin/bash

# basic
sudo apt-get install -y git build-essentials libxslt-dev libxml2-dev libcurl4-openssl-dev

#server
sudo apt-get install -y nginx

#mysql
sudo apt-get install -y mysql-server libmysql-ruby libmysqlclient-dev phpmyadmin
echo "default-storage-engine = myisam" | sudo tee -a /etc/mysql/my.cnf
sudo service mysql restart

#postgres
sudo apt-get install -y postgresql libpq-dev
sudo -u postgres createuser --superuser $USER
sudo -u postgres psql postgres -tAc "ALTER user $USER with PASSWORD '$USER'"

# user
ssh-keygen
echo export RAILS_ENV=production >  ~/.bash_profile