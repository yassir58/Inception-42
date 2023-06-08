#!/bin/bash



wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

mv adminer-4.8.1.php adminer.php
mv adminer.php /var/www/html/

chown www-data:www-data /var/www/html/adminer.php
chmod 644 /var/www/html/adminer.php

exec "$@"
