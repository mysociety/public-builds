#!/usr/bin/env bash -eux

if [ x"$PACKER_SITE_NAME" = x"fixmystreet" ] ; then
  echo "==> Installing FixMyStreet Perl Modules into /usr/share/fixmystreet/local..."
  cd /opt/mysociety
  git clone --recursive git://github.com/mysociety/fixmystreet.git
  source /opt/mysociety/commonlib/shlib/installfns
  CONF_DIRECTORY=/opt/mysociety/fixmystreet/conf
  DISTRIBUTION="$(lsb_release -i -s  | tr A-Z a-z)"
  DISTVERSION="$(lsb_release -c -s)"
  install_website_packages
  mkdir -p /usr/share/fixmystreet/local
  cd /opt/mysociety/fixmystreet
  ln -sf /usr/share/fixmystreet/local local
  bin/install_perl_modules
  chown -R vagrant:vagrant /usr/share/fixmystreet/local
  cd ..
  rm -fr fixmystreet
else
  echo "==> Skipping site-specific installation"
fi
