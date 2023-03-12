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
ADD ./tools/configure.sh /var/wordpress-tools/configure.sh
# ADD ./tools/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN ["sh" , "/var/wordpress-tools/configure.sh"]

# configuring php-fpm

RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini && \
    sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf




ENTRYPOINT ["php-fpm7.3"]

CMD ["-F"]
