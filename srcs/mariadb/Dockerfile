# Utiliser l'image de base Debian Bullseye
FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copier le fichier de configuration MariaDB / db.sh
COPY my.cnf /etc/mysql/my.cnf
COPY db.sh /etc/mysql/db.sh

RUN mkdir /run/mysqld && chown -R mysql:root /run/mysqld

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Commande pour démarrer MariaDB
RUN chmod -R 755 /etc/mysql
RUN chmod 755 /etc/mysql/db.sh

#CMD ["tail", "-f", "/dev/null"]
CMD ["bash", "/etc/mysql/db.sh"]
