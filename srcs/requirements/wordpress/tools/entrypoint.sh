# wordpress configuration

# database constant
# configure wordpress 
DB_NAME="wordpress"
DB_USER="yelatman"
DB_PASSWORD="test@1234@test"
DB_HOST="mariadb"

DB_PASSWD_PT="password_here"
DB_NAME_PT="database_name_here"
DB_USER_PT="username_here"
DB_HOST_PT="localhost"


# echo "Configuring wordpress database connection"

# mv wp-config-sample.php wp-config.php
# sed -i "s/$DB_NAME_PT/$DB_NAME/g" wp-config.php
# sed -i "s/$DB_USER_PT/$DB_USER/g" wp-config.php
# sed -i "s/$DB_HOST_PT/$DB_HOST/g" wp-config.php
# sed -i "s/$DB_PASSWD_PT/$DBU_PASS/g" wp-config.php

su -s /bin/sh -c "wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST" www-data
#  --extra-php='<?php define( 'WP_SITEURL', 'https://' . $_SERVER['HTTP_HOST'] . '/var/www/wordpress' ); ?>' www-data


# configure php-fpm

sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini 
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

# starting php-fpm

php-fpm7.3 --nodaemonize 