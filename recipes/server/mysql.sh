#!/usr/bin/bash

sudo apt-get install -y mysql-server libmysqlclient-dev phpmyadmin
echo "default-storage-engine = myisam" | sudo tee -a /etc/mysql/my.cnf
sudo service mysql restart
