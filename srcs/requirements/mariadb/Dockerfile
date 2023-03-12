# mariaDb dockerfile


ARG VERSION=buster
FROM debian:${VERSION}

# installing basic utilities
RUN apt-get update && apt-get upgrade
RUN apt-get update && apt-get install wget curl coreutils openrc -y

# installing mariadb

RUN apt-get update && apt-get install mysql mysql-client -y

# changing the owner of the data directory
RUN chown -R mysql:mysql /var/lib/mysql

# initializing the main mariaDb database
RUN mkdir /var/myscripts
ADD ./tools/configure.sh /var/myscripts/ 
RUN ["sh", "./tools/configure.sh"]

# startign the main mariaDb service

RUN /etc/init.d/mariadb start
