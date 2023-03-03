# wordpress dockerfile
ARG VERSION=3.17.1
FROM alpine:${VERSION}

RUN apk update && apk upgrade

# installing dependencies

RUN mkdir /var/wordpress-tools
ADD ./tools/install.sh /var/wordpress-tools/install.sh

# add www-data user
RUN adduser -D www-data-user
RUN addgroup www-data-user www-data
RUN ["sh", "/var/wordpress-tools/install.sh"]

# configuring wordpess

WORKDIR /var/www/wordpress 
ADD ./tools/configure.sh /var/wordpress-tools/configure.sh
RUN ["sh" , "/var/wordpress-tools/configure.sh"]
