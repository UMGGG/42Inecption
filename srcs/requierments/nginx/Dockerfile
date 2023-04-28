FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/ngins_setting.sh /var/www

RUN chmod +x /var/www/nginx_setting.sh

ENTRYPOINT [ "var/www/nginx_setting.sh" ]

CMD ["nginx", "-g", "daemon off;"]
