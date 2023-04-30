FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl dumb-init

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_setting.sh /var/www

RUN chmod +x /var/www/nginx_setting.sh

ENTRYPOINT [ "dumb-init", "--" ]

CMD ["var/www/nginx_setting.sh"]
