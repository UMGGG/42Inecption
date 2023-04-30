FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl

EXPOSE 443

# COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_setting.sh /

RUN chmod +x /nginx_setting.sh

CMD [ "/nginx_setting.sh" ]
