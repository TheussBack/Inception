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

wp core install --url="hrobin.42.fr" --title="Prout" --admin_user="wp_user"  --admin_password="wp_pass" --admin_email="admin@admin.fr" --skip-email --allow-root
wp user create hrobin test@example.com --role=author  --allow-root

php-fpm7.4 -F -R
