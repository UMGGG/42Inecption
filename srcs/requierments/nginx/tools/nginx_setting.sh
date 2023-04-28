#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ];
then
echo "Nginx setting...";
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -subj "/C=KR/ST=Seoul/O=42Seoul/OU=jaeyjeon/CN=Inception/"
echo "Nginx setting fin";
fi

echo "127.0.0.1 jaeyjeon.42.fr" >> /etc/hosts

exec "$@"
