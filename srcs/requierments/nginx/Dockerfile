FROM debian:buster

RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/ngins_setting.sh /var/www

RUN chmod +x /var/www/nginx_setting.sh

ENTRYPOINT [ "var/www/nginx_setting.sh" ]

CMD ["nginx", "-g", "daemon off;"]
