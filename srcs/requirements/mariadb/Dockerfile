# mariaDb dockerfile


ARG VERSION=buster
FROM debian:${VERSION}

# installing basic utilities
RUN apt-get update && apt-get upgrade
RUN apt-get update && apt-get install wget curl coreutils  gnupg2 ca-certificates lsb-release apt-transport-https -y

# installing mariadb

RUN apt-get update && apt-get install mariadb-server -y
# starting the main mariaDb service

RUN mkdir -p /var/run/scripts 
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 770 /var/lib/mysql
ADD ./tools/entrypoint.sh /var/run/scripts/
# ADD ./tools/setup.sql /var/run/scripts/
EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/var/run/scripts/entrypoint.sh"]
