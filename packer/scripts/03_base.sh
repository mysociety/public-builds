#!/usr/bin/env bash -eux
#

echo "==> Cloning mySociety commonlib repository"
mkdir -p /opt/mysociety
apt-get install -qq -y git >/dev/null
cd /opt/mysociety
git clone git://github.com/mysociety/commonlib.git

echo "==> Installing core packages"
source /opt/mysociety/commonlib/shlib/installfns
core_package_install
DISTRIBUTION="$(lsb_release -i -s  | tr A-Z a-z)"
DISTVERSION="$(lsb_release -c -s)"

echo "==> Adding mySociety Apt repository"
update_mysociety_apt_sources
