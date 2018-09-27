#!/usr/bin/env bash -eux

# Build repo cleanup
rm -fr /opt/mysociety/*

# Package cleanup.
apt-get -y purge --auto-remove build-essential module-assistant
apt-get -y autoremove --purge
apt-get -y clean

## Networking
for rules in \
  "/etc/udev/rules.d/70-persistent-net.rules" \
  "/lib/udev/rules.d/75-persistent-net-generator.rules" ;
do
  if [ -e "${rules}" ] ; then rm -f ${rules} ; fi
done

if [ -d "/dev/.udev/" ]; then rm -fr /dev/.udev/ ; fi

echo "pre-up sleep 2" >> /etc/network/interfaces

## DHCP
rm -fr /var/lib/dhcp/*

## Shell history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

## Log files
find /var/log -type f | while read log ; do :> $log ; done

## tmp
rm -fr /tmp/*

## machine-id
if [ -e "/etc/machine-id" ] ; then
  :>/etc/machine-id
fi

## Disk space
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
