# Utiliser l'image de base Debian
FROM debian:bullseye

# Mettre à jour les paquets et installer wget, php7.4, php-fpm et php-mysql
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client

# Installer WordPress CLI pour faciliter l'installation
RUN apt-get install -y curl less bash
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Créer un répertoire pour WordPress
RUN mkdir -p /var/www/html

COPY /tools/wp-config.php /etc
# Créer le répertoire pour le fichier PID de PHP-FPM
RUN mkdir -p /run/php

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier le fichier de configuration PHP-FPM
COPY /conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY /tools/wp_install.sh /etc
# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

# Commande pour démarrer PHP-FPM
CMD ["bash", "/etc/wp_install.sh"]
