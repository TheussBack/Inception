# Utiliser l'image de base Debian Bullseye
FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copier le fichier de configuration MariaDB
COPY my.cnf /etc/mysql/my.cnf

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Commande pour démarrer MariaDB
RUN chmod -R 755 mysql
RUN chmod 755 db.sh

#CMD ["tail", "-f", "/dev/null"]
CMD ["bash", "/var/db.sh"]
