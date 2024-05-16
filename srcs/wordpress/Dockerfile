# Utiliser l'image de base Alpine
FROM alpine:latest

# Installer les paquets nécessaires
RUN apk update && apk add --no-cache php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring php7-gd php7-pear php7-zip

# Installer WordPress CLI pour faciliter l'installation
RUN apk add --no-cache curl less bash
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Créer un répertoire pour WordPress
RUN mkdir -p /var/www/html

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier le fichier de configuration PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

# Commande pour démarrer PHP-FPM
CMD ["php-fpm7", "-F"]
