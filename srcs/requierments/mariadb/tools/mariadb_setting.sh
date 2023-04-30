#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS wordpress ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY '12345';"  >> db1.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';"  >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';"  >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
