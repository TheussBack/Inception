# Utiliser l'image de base Alpine
FROM alpine:latest

# Installer NGINX et OpenSSL
RUN apk update && apk add --no-cache nginx openssl

# Copier les certificats dans le conteneur
COPY certs /etc/nginx/certs

# Copier le fichier de configuration NGINX dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 443 pour le trafic HTTPS
EXPOSE 443

# Commande pour lancer NGINX en mode non-démon
CMD ["nginx", "-g", "daemon off;"]

