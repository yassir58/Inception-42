
ROOT_PASS=test@123@test

# install mariadb database 
mysql_install_db  --user=mysql --skip-test-db

# configuring mariadb server

MARIADB_SERVER_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf
N=$(cat $MARIADB_SERVER_CONF | grep -m1 -n bind-address | cut -d: -f1)
sed -i "${N}s/127.0.0.1/0.0.0.0/g" $MARIADB_SERVER_CONF

service mysql start
securing mariadb installation
mysql_secure_installation <<EOF
$ROOT_PASS
$ROOT_PASS
y 
y
y
n
EOF

# # # setup mraidb database
mysql -u root  < /var/run/scripts/setup.sql

service mysql stop
# starting the mariaBd daemon
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
