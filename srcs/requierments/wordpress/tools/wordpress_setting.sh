#!/bin/bash


mkdir -p /var/www/html

cd /var/www/html
if [ ! -f /var/www/html/wp-config.php ]; then

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER_LOGIN $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
fi

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -R -F
