#!/bin/bash

if [ ! -f /etc/ssl/nginx-selfsigned.crt ]; then
echo "Nginx setting...";
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -subj "/C=KR/ST=Seoul/O=42Seoul/OU=jaeyjeon/CN=Inception/"

chown nginx /etc/ssl/nginx-selfsigned.key
chown nginx /etc/ssl/nginx-selfsigned.crt

# mv /default /etc/nginx/sites-enabled/default
fi

exec nginx -g "daemon off;"
