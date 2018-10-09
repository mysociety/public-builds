#!/usr/bin/env bash -eux

if [ x"$PACKER_SITE_NAME" = x"fixmystreet" ] ; then
  echo "==> Doing initial site install..."
  cd /home/vagrant
  git clone --recursive git://github.com/mysociety/fixmystreet.git
  mkdir -p /usr/share/fixmystreet/local
  ln -sf /usr/share/fixmystreet/local /home/vagrant/fixmystreet/local
  chown -R vagrant:vagrant /usr/share/fixmystreet/local
  wget -O install-site.sh --no-verbose https://github.com/mysociety/commonlib/raw/master/bin/install-site.sh
  sh install-site.sh --dev fixmystreet vagrant 127.0.0.1.xip.io
  chown -R vagrant:vagrant /usr/share/fixmystreet/local
  rm -fr fixmystreet
else
  echo "==> Skipping site-specific installation"
fi
