# nginx dockerfile

# Docker base image

ARG VERSION=3.17.1
FROM alpine:${VERSION}


RUN apk upgrade && apk update && apk add openssl curl ca-certificates

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


RUN apk upgrade && apk update &&  apk add nginx

ENV DEFAULT_CONF="./conf/default.conf"
ENV DEFAULT_CONF_PATH="/etc/nginx/conf.d/default.conf"
ENV SRV_RESOURCE="/srv/html"
ENV NGINX_RUN="/run/nginx"
ENV HOSTNAME="yelatman.42.ma"
ENV NGINX_SCRIPT_SRC="./tools/configure.sh"
ENV NGINX_SCRIPT_DEST="/run/nginx/"
RUN mkdir ${SRV_RESOURCE} ${NGINX_RUN}
ADD ${NGINX_SCRIPT_SRC} ${NGINX_SCRIPT_DEST}
ADD index.html ${SRV_RESOURCE}
COPY ${DEFAULT_CONF} ${DEFAULT_CONF_PATH}

#CMD ["-g", "daemon  off;"]

EXPOSE 80

ENTRYPOINT ["sh" , "/run/nginx/configure.sh", "yelatman.42.fr"]

# EXPOSE 8080
