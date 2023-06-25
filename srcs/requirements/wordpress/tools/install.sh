# script variable definition
WP_CLI_VERS=2.7.1
WORDPRESS_SOURCE_FILES="http://wordpress.org/latest.tar.gz"
PHP-VERSION=php


echo -e "Installing basic utilities ... "
apt-get update -y && apt-get install curl sendmail default-mysql-client php php-fpm \
	php-curl php-json php-mbstring php-mysql php-zip -y

# downloading wordpress CLI
if [ ! -f /usr/local/bin/wp ]; then
	echo -e "Installing wordpress CLI "
	 curl -v --retry 6 -Ls https://github.com/wp-cli/wp-cli/releases/download/v$WP_CLI_VERS/wp-cli-$WP_CLI_VERS.phar \
		-o /var/wordpress-tools/wp-cli-$WP_CLI_VERS.phar 2> /var/wordpress-tools/error.log
	php /var/wordpress-tools/wp-cli-$WP_CLI_VERS.phar --info > /var/wordpress-tools/cli-info
	mv /var/wordpress-tools/wp-cli-$WP_CLI_VERS.phar /usr/local/bin/wp 
	chmod +x /usr/local/bin/wp
fi

# remove old wordpress directory
if [ -d /var/www/wordpress ]; then
        rm -rf /var/www/wordpress
fi

# create wordpress directory
mkdir -p /var/www/wordpress
# adding www-data user as te wordpress directory owner

chown -R www-data:www-data /var/www/wordpress

# Downloading Wordpress using the wordpress CLI
echo -e "Downloading Wordpress core "
su -s /bin/sh -c 'wp --path=/var/www/wordpress core download' www-data

# changing permissions for wordpress 
chmod -R 755 /var/www/wordpress