# nginx dockerfile

# Docker base image
FROM alpine:3.17.1

RUN apk update
RUN apk add nginx

ADD index.html /var/lib/nginx/html/;

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

EXPOSE 80

# EXPOSE 8080
