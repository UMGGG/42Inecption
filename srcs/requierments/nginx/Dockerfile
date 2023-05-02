FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl dumb-init

RUN mkdir -p /etc/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/nginx-selfsigned.key \
	-out /etc/ssl/nginx-selfsigned.crt \
	-subj "/C=KR/ST=Seoul/O=42Seoul/OU=jaeyjeon/CN=Inception/"

RUN mkdir -p /run/nginx

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
# COPY ./tools/nginx_setting.sh /
# COPY ./conf/default /

# RUN chmod +x /nginx_setting.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--"]

CMD [ "nginx" "-g" "daemon off;" ]
