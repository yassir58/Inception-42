
ROOT_PASS=test@123@test

# install mariadb database 
mysql_install_db  --user=mysql --skip-test-db

# configuring mariadb server

MARIADB_SERVER_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf
N=$(cat $MARIADB_SERVER_CONF | grep -m1 -n bind-address | cut -d: -f1)
sed -i "${N}s/127.0.0.1/0.0.0.0/g" $MARIADB_SERVER_CONF

service mysql start

# # # setup mraidb database
# mysql -u root  < /var/run/scripts/setup.sql
mysql -u root -p$ROOT_PASS -e "CREATE DATABASE wordpress;"
mysql -u root -p$ROOT_PASS -e "CREATE USER '$MYSQL_HOST'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p$ROOT_PASS -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_HOST'@'%';"
mysql -u root -p$ROOT_PASS -e "FLUSH PRIVILEGES;"
service mysql stop
# starting the mariaBd daemon
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
