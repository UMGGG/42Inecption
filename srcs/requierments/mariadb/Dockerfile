FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install mariadb-server

EXPOSE	3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb_setting.sh /

chmod +x /mariadb_setting.sh

CMD		["/mariadb_setting.sh"]
