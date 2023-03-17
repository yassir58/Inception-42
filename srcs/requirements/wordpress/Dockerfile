# wordpress dockerfile

ARG VERSION=buster
FROM debian:${VERSION}

RUN apt-get update && apt-get upgrade

# installing dependencies

RUN apt-get update && apt-get install gcc -y
RUN mkdir /var/wordpress-tools
ADD ./tools/install.sh /var/wordpress-tools/install.sh
RUN apt-get update && apt-get install supervisor -y

# add www-data user
RUN mkdir -p /run/php && touch /run/php/php-fpm7.3
RUN deluser www-data && addgroup www-data
RUN adduser --system --uid 82 --no-create-home --ingroup www-data --disabled-login --disabled-password www-data



RUN ["sh", "/var/wordpress-tools/install.sh"]
# installing dumb-init
# RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_amd64.deb
# RUN dpkg -i dumb-init_*.deb

# configuring wordpess

WORKDIR /var/www/wordpress 
ADD ./tools/entrypoint.sh /var/wordpress-tools/entrypoint.sh
# ADD ./tools/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf


# configuring php-fpm



RUN mkdir /var/www/test
ADD ./tools/test/index.php /var/www/test/


ENTRYPOINT ["/bin/sh", "/var/wordpress-tools/entrypoint.sh"]

# CMD ["-F"]
