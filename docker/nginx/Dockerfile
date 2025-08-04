FROM mysocietyorg/debian:latest
MAINTAINER sysadmin@mysociety.org

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y nginx --no-install-recommends \
    && rm -r /var/lib/apt/lists/*
COPY --chown=www-data:www-data nginx.conf /etc/nginx/nginx.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
