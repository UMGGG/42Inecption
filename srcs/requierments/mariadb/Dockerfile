FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install mariadb-server

EXPOSE	3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb_setting.sh /

RUN chmod +x /mariadb_setting.sh

RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

CMD		["/mariadb_setting.sh"]
