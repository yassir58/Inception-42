# script variable definition
WP_CLI_VERS=2.7.1
WORDPRESS_SOURCE_FILES="http://wordpress.org/latest.tar.gz"
SITE_URL=yelatman.42.ma
SITE_TITLE=example
ADMIN_USER=gigachad
ADMIN_PASSWD=Test@2023@2024



apk update && apk upgrade

# adding more repositories to /etc/apk/repositories

echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories


echo -e "Installing php dependencies ..."


apk update && apk add php php-fpm php-mysqli php-curl php-mbstring php-xml php-gd php-zip php-openssl php-phar 

echo -e "Installing extra packages ... "
apk update && apk add wget mysql mysql-client curl coreutils openrc

/home/gigachad/Inception-42/srcs/requirements/wordpress/tools
echo -e "Downloading the latset wordpress source files "

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

echo "Installing wordpress core "
su -s /bin/sh -c "wp core install --url=$SITE_URL --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWD" www-data

# changing permissions for wordpress 
chmod g+w /var/www/wordpress/wp-content
chmod -R g+w /var/www/wordpress/wp-content/themes
chmod -R g+w /var/www/wordpress/wp-content/plugins