#!/usr/bin/env bash -eux

echo "==> Installing prerequites."
apt-get -y install build-essential module-assistant linux-headers-amd64

echo "==> Installing Guest Additions."
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_${VERSION}.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run --nox11
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/VBoxGuestAdditions_${VERSION}.iso
rm /home/vagrant/.vbox_version
