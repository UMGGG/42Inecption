FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install \
		php7.3 \
		php-fpm \
		wget \
		curl \
		php-mysqli \
		sendmail

EXPOSE	9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_setting.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F -R"]
