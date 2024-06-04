#!/bin/sh

touch tmp/toto;
chmod 755 tmp/toto;

cat << stop_file > tmp/toto
FLUSH PRIVILEGES;
CREATE DATABASE inception;
USE inception;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON inception.* TO 'wp_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS test ;
stop_file

echo "test if tmp/toto exist"
cat tmp/toto
mysql_install_db --user=mysql --ldata=/var/lib/mysql/
mysqld --skip-grant-tables --user=mysql --user=mysql --bootstrap < tmp/toto
exec mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

#RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql/ # marche pas -> a mettre dans script
#RUN service mariadb start # marche pas -> a mettre dans script
#CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
#ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
