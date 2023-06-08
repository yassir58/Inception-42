#!/bin/bash
# wordpress configuration

# wait until the mariadb service is up 
until mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -e "SELECT 1"; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done


# create the wp-config.php file 
su -s /bin/sh -c "wp config create --dbname=$DATABASE_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST" www-data
# set the redis service host
wp config set WP_REDIS_HOST 'redis' --allow-root
# set the redis service port 
wp config set WP_REDIS_PORT '6379' --allow-root
wp config set WP_CACHE 'true' --allow-root
wp config set FORSE_SSL_ADMIN 'false' --allow-root
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini 
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf
# install wordpress
su -s /bin/sh -c "wp core install --url=$SITE_URL --title=$SITE_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD\
    --admin_email=$WORDPRESS_ADMIN_EMAIL" www-data
wp user create $WORDPRESS_USER  $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
wp theme install inspiro --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# starting php-fpm server in forground
exec "$@"
   
   