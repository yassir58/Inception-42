# wordpress configuration

# database constant
# configure wordpress 
DB_NAME="wordpress"
DB_USER="wordpress"
DBU_PASS="Test@2023@2024"

DB_PASSWD_PT="password_here"
DB_NAME_PT="database_name_here"
DB_USER_PT="username_here"
DB_HOST_PT="localhost"


echo "Configuring wordpress database connection"

mv wp-config-sample.php wp-config.php
sed -i "s/$DB_NAME_PT/$DB_NAME/g" wp-config.php
sed -i "s/$DB_USER_PT/$DB_USER/g" wp-config.php
sed -i "s/$DB_HOST_PT/$DB_HOST/g" wp-config.php
sed -i "s/$DB_PASSWD_PT/$DBU_PASS/g" wp-config.php

# configure php-fpm