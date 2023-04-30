#!/bin/bash

mkdir -p /var/www/html
wget https://wordpress.org/latest.tar.gz \
tar -xvf latest.tar.gz && \
mv /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html && \
rm -r /wordpress latest.tar.gz

mv /var/www/wp-config.php /var/www/html/wp-config.php
rm -r /var/www/wp-config.php
mv ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

chmod -R +x /var/www/html

/usr/sbin/php-fpm7.3 -R -F
