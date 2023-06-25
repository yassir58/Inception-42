#!/bin/bash 

curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub 
openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout 
mv /tmp/nginx_signing.rsa.pub /etc/apt/trusted.gpg.d/ 
deluser www-data && addgroup www-data 
adduser --system --uid 82 --no-create-home --ingroup www-data --disabled-login --disabled-password www-data 
chmod 700 /etc/ssl/private 
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=$HOSTNAME"

exec "$@"