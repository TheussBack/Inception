#!/bin/bash

wp core download --allow-root

cp /etc/wp-config.php /var/www

chmod -R 755 /var/www/

until mysqladmin -hmariadb -uwp_user -pwp_pass ping && \
         mariadb -hmariadb -uwp_user -pwp_pass -e "SHOW DATABASES;" | grep inception; do
    sleep 2
    echo "waiting to connect..."
done
echo "successfuly connected to db"

  sleep 5
  wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
  sleep 5

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER  --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --role=editor --porcelain --allow-root
php-fpm7.4 -F -R