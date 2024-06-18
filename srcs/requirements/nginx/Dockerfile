# Utiliser l'image de base Debian Bullseye
FROM debian:bullseye

# Installer NGINX et OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/certs /etc/nginx/ssl/private

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048  \
    -out /etc/nginx/ssl/certs/hrobin.pem \
    -keyout /etc/nginx/ssl/private/hrobin.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=hrobin.42.fr/CN=hrobin.42.fr/"

# Copier le fichier de configuration NGINX dans le conteneur
COPY /conf/nginx.conf /etc/nginx/conf.d/proxy.conf

# Exposer le port 443 pour le trafic HTTPS
EXPOSE 443

# Commande pour lancer NGINX en mode non-démon
CMD ["nginx", "-g", "daemon off;"]
