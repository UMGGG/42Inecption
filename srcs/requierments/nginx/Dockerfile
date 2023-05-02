FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl dumb-init

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_setting.sh /
# COPY ./conf/default /

RUN chmod +x /nginx_setting.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--"]

CMD [ "/nginx_setting.sh" ]
