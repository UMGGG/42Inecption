CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES
ALTER USER 'root'@'loaclhost' IDENTFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES
