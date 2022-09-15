FROM mysocietyorg/debian:bullseye
LABEL maintainer="sysadmin@mysociety.org"

RUN apt-get update && apt-get install -y \
        apache2 \
        php-fpm \
        supervisor \
      --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN set -x; \
# Enable required modules and configurations
    a2enmod proxy_fcgi setenvif; \
    a2enconf php7.4-fpm; \
    mkdir -p /run/php; \
# logs should go to stdout / stderr
    ln -sfT /proc/self/fd/2 /var/log/apache2/error.log; \
    ln -sfT /proc/self/fd/1 /var/log/apache2/access.log; \
    ln -sfT /proc/self/fd/1 /var/log/apache2/other_vhosts_access.log; \
    ln -sfT /proc/self/fd/2 /var/log/php7.4-fpm.log; \
# Pass environment to PHP-FPM
    sed -i -e 's/^;clear_env/clear_env/' /etc/php/7.4/fpm/pool.d/www.conf

COPY security.conf /etc/apache2/conf-available/security.conf
COPY ./supervisord /etc/supervisor/conf.d

EXPOSE 80
CMD ["/usr/bin/supervisord", "--nodaemon"]
