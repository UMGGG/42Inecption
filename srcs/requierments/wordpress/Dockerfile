FROM	debian:buster

RUN		apt-get update -y
		apt-get upgrade -y
		apt-get -y install \
		php7.3 \
		php-fpm \
		php-cli \
		wget \
		curl \
		php-mysql \
		php-mbstring \
		php-xml \
		sendmail

EXPOSE	9000

RUN		wget https://wordpress.org/latest.tar.gz && \
		tar -xvf latest.tar.gz && \
		mv /wordpress/* /var/www/html && \
		rm -r /wordpress latest.tar.gz
