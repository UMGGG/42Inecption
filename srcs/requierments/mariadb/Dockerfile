FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install mariadb-server

EXPOSE	3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/initial_db.sql /

RUN		service mysql start && mysql < /initial_db.sql && rm -f /initial_db.sql;

CMD		["mysqld"]
