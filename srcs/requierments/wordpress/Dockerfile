FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install php-fpm php-mysql curl\

EXPOSE	9000

COPY ./tools/wordpress_setting.sh /
COPY ./tools/wp-config.php /

CMD [ "/wordpress_setting.sh" ]
