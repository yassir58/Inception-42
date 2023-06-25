# wordpress dockerfile

FROM debian:buster


RUN mkdir /var/wordpress-tools
ADD ./tools/install.sh /var/wordpress-tools/install.sh


# add www-data user
RUN mkdir -p /run/php && touch /run/php/php-fpm7.3 \
    && deluser www-data && addgroup www-data \
    && adduser --system --uid 82 --no-create-home --ingroup www-data --disabled-login --disabled-password www-data
RUN ["sh", "/var/wordpress-tools/install.sh"]
WORKDIR /var/www/wordpress 
ADD ./tools/entrypoint.sh /var/wordpress-tools/entrypoint.sh
RUN chmod +x /var/wordpress-tools/entrypoint.sh
ENTRYPOINT [ "/var/wordpress-tools/entrypoint.sh" ]
CMD ["php-fpm7.3", "-F"]
