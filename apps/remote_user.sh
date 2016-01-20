#!/bin/bash 

user=$1
server=$2

# ssh-copy-id root@$server
ssh root@$server -t "adduser $user"
ssh-copy-id $user@$server
ssh root@$server -t "passwd -d $user"
ssh root@$server -t "visudo -f /etc/sudoers"
