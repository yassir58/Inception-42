# mariaDb dockerfile
FROM debian:buster

RUN apt-get update && apt-get install curl gnupg2 mariadb-server -y
ADD ./tools/entrypoint.sh /
RUN chmod +x //entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld_safe" , "--datadir=/var/lib/mysql"]
