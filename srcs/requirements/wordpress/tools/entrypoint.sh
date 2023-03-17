# wordpress configuration

# database constant
# configure wordpress 


DB_NAME="wordpress"
DB_USER="yelatman"
DB_PASSWORD="test@1234@test"
DB_HOST="mariadb"
SITE_URL=https://localhost
SITE_TITLE=example
ADMIN_USER=gigachad
ADMIN_PASSWD=Test@2023@2024
ADMIN_EMAIL=elatmaniyassir3@gmail.com


# echo "Configuring wordpress database connection"

# mv wp-config-sample.php wp-config.php
# sed -i "s/$DB_NAME_PT/$DB_NAME/g" wp-config.php
# sed -i "s/$DB_USER_PT/$DB_USER/g" wp-config.php
# sed -i "s/$DB_HOST_PT/$DB_HOST/g" wp-config.php
# sed -i "s/$DB_PASSWD_PT/$DBU_PASS/g" wp-config.php


#  --extra-php='<?php define( 'WP_SITEURL', 'https://' . $_SERVER['HTTP_HOST'] . '/var/www/wordpress' ); ?>' www-data

until mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "SELECT 1"; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done

echo "Creating wordpress config"
su -s /bin/sh -c "wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST" www-data

su -s /bin/sh -c "wp config set FS_METHOD direct --type=constant" www-data
su -s /bin/sh -c "wp config set FS_CHMOD_DIR \"0755 & ~umask()\" --type=constant" www-data
su -s /bin/sh -c "wp config set FS_CHMOD_FILE \"0644 & ~umask()\" --type=constant" www-data
echo "Installing wordpress core "
su -s /bin/sh -c "wp core install --url=$SITE_URL --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWD \
    --admin_email=$ADMIN_EMAIL" www-data

su -s /bin/sh -c "wp user create test  ilyastest@gmail.com --role=author --user_pass=$DB_PASSWORD --allow-root" www-data

# configure php-fpm

# creating user 


sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini 
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

# starting php-fpm

php-fpm7.3 --nodaemonize 