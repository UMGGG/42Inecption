#!/bin/bash

echo "Nginx setting...";
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -subj "/C=KR/ST=Seoul/O=42Seoul/OU=jaeyjeon/CN=Inception/"

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    #server_name www.$WP_URL $WP_URL;
    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;
    index index.php;
    root /var/www/html;
    location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >>  /etc/nginx/sites-available/default


nginx -g "daemon off;"
