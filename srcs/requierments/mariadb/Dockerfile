FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install mariadb-server

EXPOSE	3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb_setting.sh /

RUN		service mysql start && mysql < /var/www/initial_db.sql && rm -f /initial_db.sql;

CMD		["mysqld"]
