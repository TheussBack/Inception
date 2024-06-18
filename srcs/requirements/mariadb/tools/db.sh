#!/bin/sh

touch tmp/toto
chmod 755 tmp/toto

cat <<stop_file >tmp/toto
FLUSH PRIVILEGES;
CREATE DATABASE inception;
USE inception;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON inception.* TO 'wp_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS test ;
stop_file

echo "test if tmp/toto exist"
cat tmp/toto
mysql_install_db --user=mysql --ldata=/var/lib/mysql/
mysqld --defaults-file=/etc/mysql/conf.d/50-server.cnf --user=mysql --bootstrap <tmp/toto
exec mysqld --defaults-file=/etc/mysql/conf.d/50-server.cnf --user=mysql --console $@
