#!/usr/bin/env bash

IP="$(ifconfig | grep "inet " | head -n1 | awk '{ print $2 }')"

pacman -Su
pacman -S openssh

systemctl start sshd

mkdir /root/.ssh
curl https://github.com/mofe23.keys > ~/.ssh/authorized_keys

echo "sshd set upsucessfully"
echo "Connect with $ ssh root@${IP}"

