#!/bin/sh

touch tmp;
chmod 755 tmp;

cat << stop_file > tmp
CREATE DATABASE inception;
USE inception;
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON inception.* TO 'wp_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS test ;
stop_file

echo "test if tmp exist"
cat tmp
mysql --usermysql --bootstrap < tmp
exec mysql --user=mysql --console --skip-name-resolve --skip-networking=0 $@

#RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql/ # marche pas -> a mettre dans script
#RUN service mariadb start # marche pas -> a mettre dans script
