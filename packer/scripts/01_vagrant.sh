#!/usr/bin/env bash -eux
#

echo "==> Setting up Vagrant user."
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
curl -L -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/*
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant
