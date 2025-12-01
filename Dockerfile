# Utilisation d'une image de base Alpine Linux légère
FROM alpine:latest

# Installation de Nginx
RUN apk add --no-cache nginx

# Création du répertoire pour Nginx
RUN mkdir -p /run/nginx

# Copie du fichier index.html local vers le conteneur
COPY index.html /usr/share/nginx/html/index.html

# Exposition du port 80
EXPOSE 80

# Démarrage de Nginx en mode foreground
CMD ["nginx", "-g", "daemon off;"]
