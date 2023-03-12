# nginx dockerfile

# Docker base image

ARG VERSION=buster
FROM debian:${VERSION}

ENV DEFAULT_CONF="./conf/default"
ENV DEFAULT_CONF_PATH="/etc/nginx/sites-enabled/default"
ENV SRV_RESOURCE="/srv/html"
ENV NGINX_RUN="/run/nginx"
ENV HOSTNAME="yelatman.42.ma"
ENV NGINX_SCRIPT_SRC="./tools/configure.sh"
ENV NGINX_SCRIPT_DEST="/run/nginx/"

RUN apt-get update && apt-get upgrade
# installing extra packages
RUN apt-get update && apt-get install openssl curl  gnupg2 ca-certificates lsb-release apt-transport-https -y

# verify packages authenticity

RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout
RUN mv /tmp/nginx_signing.rsa.pub /etc/apt/trusted.gpg.d/

# add www-data user
RUN deluser www-data && addgroup www-data
RUN adduser --system --uid 82 --no-create-home --ingroup www-data --disabled-login --disabled-password www-data

# RUN chown -R www-data:www-data 
# install nginx
RUN apt-get update && apt-get install nginx -y

# create a ssl certeficate
RUN chmod 700 /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=$HOSTNAME"


# testing
RUN mkdir ${SRV_RESOURCE} ${NGINX_RUN}
ADD ${NGINX_SCRIPT_SRC} ${NGINX_SCRIPT_DEST}
ADD index.html ${SRV_RESOURCE}
RUN mkdir /srv/wordpess 
RUN mkdir /srv/html/secure 
ADD ./secure.html /srv/html/secure/
ADD ./index.php /srv/wordpress/index.php
COPY ${DEFAULT_CONF} ${DEFAULT_CONF_PATH}


CMD ["-g", "daemon  off;"]

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["nginx"]

# EXPOSE 8080
