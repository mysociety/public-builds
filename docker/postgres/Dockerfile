# Simple Dockerfile to build a Postgres image localised to en_GB
FROM postgres:9.6.24
MAINTAINER sysadmin@mysociety.org
RUN localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8
