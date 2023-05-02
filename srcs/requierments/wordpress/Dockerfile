FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install php-fpm php-mysql curl dumb-init

EXPOSE	9000

COPY ./tools/wordpress_setting.sh /
COPY ./tools/wp-config.php /

RUN chmod +x /wordpress_setting.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--"]

CMD [ "/wordpress_setting.sh" ]
