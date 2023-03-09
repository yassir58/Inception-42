# nginx dockerfile

# Docker base image

ARG VERSION=3.17.1
FROM alpine:${VERSION}

ENV DEFAULT_CONF="./conf/default.conf"
ENV DEFAULT_CONF_PATH="/etc/nginx/conf.d/default.conf"
ENV SRV_RESOURCE="/srv/html"
ENV NGINX_RUN="/run/nginx"
ENV HOSTNAME="yelatman.42.ma"
ENV NGINX_SCRIPT_SRC="./tools/configure.sh"
ENV NGINX_SCRIPT_DEST="/run/nginx/"

RUN apk update && apk upgrade
# installing extra packages
RUN apk update && apk add openssl curl ca-certificates openrc

# set up the apk repository for stable nginx packages

RUN printf "%s%s%s\n" \
"http://nginx.org/packages/alpine/v" \
`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
"/main" \
| tee -a /etc/apk/repositories

# verify packages authenticity

RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout
RUN mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/

# add www-data user
RUN adduser -u 82 -D -S -G www-data www-data

# RUN chown -R www-data:www-data 
# install nginx
RUN apk update && apk add nginx


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
