#!/bin/bash
# install mariadb database 
mysql_install_db  --user=mysql --skip-test-db

# configuring mariadb server

MARIADB_SERVER_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf
N=$(cat $MARIADB_SERVER_CONF | grep -m1 -n bind-address | cut -d: -f1)
sed -i "${N}s/127.0.0.1/0.0.0.0/g" $MARIADB_SERVER_CONF

service mysql start

# # # setup mraidb database

mysql -u root -e "UPDATE mysql.user SET authentication_string = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

service mysql stop
# starting the mariaBd daemon
exec "$@"