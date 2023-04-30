FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install \
		php7.3 \
		php-fpm \
		wget \
		php-mysqli \
		php-mbstring \
		php-xml \
		php-cli \
		curl \
		dumb-init

EXPOSE	9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_setting.sh

ENTRYPOINT ["/usr/bin/dumb-init" "--" "/var/www/wordpress_setting.sh" ]

# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
