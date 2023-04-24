# mariaDb dockerfile

ARG VERSION=buster
FROM debian:${VERSION}

RUN apt-get update && apt-get install curl gnupg2 mariadb-server -y

RUN mkdir -p /var/run/tools \ 
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod -R 770 /var/lib/mysql
ADD ./tools/entrypoint.sh /var/run/scripts/

EXPOSE 3306

RUN chmod +x /var/run/scripts/entrypoint.sh
ENTRYPOINT ["/var/run/scripts/entrypoint.sh"]

CMD ["mysqld_safe" , "--datadir=/var/lib/mysql"]