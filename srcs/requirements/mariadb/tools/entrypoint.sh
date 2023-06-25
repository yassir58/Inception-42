#!/bin/bash
# configuring mariadb server
MARIADB_SERVER_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf
N=$(cat $MARIADB_SERVER_CONF | grep -m1 -n bind-address | cut -d: -f1)
sed -i "${N}s/127.0.0.1/0.0.0.0/g" $MARIADB_SERVER_CONF
service mysql start
# # # setup mraidb database
mysql -u root -h localhost  -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u root -h localhost  -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -h localhost  -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u root -h localhost  -e "FLUSH PRIVILEGES;"
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -u root -h localhost
service mysql stop
# starting the mariaBd daemon
exec "$@"