# Utiliser l'image de base Alpine
FROM alpine:latest

# Installer MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copier le fichier de configuration MariaDB
COPY my.cnf /etc/mysql/my.cnf

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Commande pour démarrer MariaDB
CMD ["mysqld"]
