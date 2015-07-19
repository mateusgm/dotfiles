#!/bin/bash

echo $1

sudo iptables -A OUTPUT -d $1 -j REJECT -p tcp -m tcp
sudo iptables -A OUTPUT -d www.$1 -j REJECT -p tcp -m tcp

for blockip in `resolveip $1 | cut -d " " -f 6`; do
  echo $blockip
  sudo iptables -A OUTPUT -o eth0 -p tcp -m tcp -d $blockip -j REJECT --reject-with tcp-reset
done

for blockip in `resolveip www.$1 | cut -d " " -f 6`; do
  echo $blockip
  sudo iptables -A OUTPUT -o eth0 -p tcp -m tcp -d $blockip -j REJECT --reject-with tcp-reset
done
