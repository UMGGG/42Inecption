FROM	debian:buster

RUN		sudo apt-get update -y
		sudo apt-get upgrade -y
		sudo apt-get -y install mariadb-server

EXPOSE	3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools /var/www/

RUN		service mysql start
RUN		mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

CMD		["mysqld"]
