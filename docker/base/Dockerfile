FROM debian:stretch-slim
MAINTAINER sysadmin@mysociety.org

# Core packages.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        apt-utils \
        ca-certificates \
        curl \
        dnsutils \
        git \
        gpg \
        locales \
        lockfile-progs \
        lsb-release \
      --no-install-recommends && rm -r /var/lib/apt/lists/*

# Our preferred locale. If you want to subsequentially add locales, append
# then to the /etc/locale.gen and re-run locale-gen.
RUN echo 'en_GB.UTF-8 UTF-8' > /etc/locale.gen \
        && /usr/sbin/locale-gen
ENV LANG=en_GB.utf8
ENV LC_ALL=en_GB.utf8

# Add mySociety and Backports APT sources.
RUN echo 'deb http://debian.mysociety.org stretch main' > /etc/apt/sources.list.d/mysociety.list \
        && echo 'deb http://ftp.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list \
        && curl http://debian.mysociety.org/debian.mysociety.org.gpg.key | apt-key add -
