#!/usr/bin/env bash -eux

echo "==> Updating system."
apt-get -y update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

echo "==> Rebooting system."
reboot
sleep 60
