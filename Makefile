# Nom du projet
PROJECT_NAME=Inception

# Variables pour les chemins
DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml

# Cibles par défaut
.PHONY: all build up down clean

# Construire et lancer les conteneurs
all: build up
	@echo "Docker containers are built and running."

# Construire les images Docker
build:
	@echo "Building Docker images..."
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

# Lancer les conteneurs en arrière-plan
up:
	@echo "Starting Docker containers..."
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

# Arrêter les conteneurs
down:
	@echo "Stopping Docker containers..."
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

# Nettoyer les conteneurs, volumes et images inutilisés
clean: down
	@echo "Cleaning up unused Docker resources..."
	@docker system prune -f
	@docker volume prune -f
	@docker image prune -f
	@sudo chmod -R 777 ./srcs/data
	@rm -rf ./srcs/data

# Recréer les conteneurs
rebuild: down build up
	@echo "Docker containers have been rebuilt and are running."

# Afficher les logs
logs:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) logs -f

# Executer bash dans le conteneur WordPress
exec-wordpress:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) exec wordpress bash

# Executer bash dans le conteneur MariaDB
exec-mariadb:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) exec mariadb bash

# Executer bash dans le conteneur NGINX
exec-nginx:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) exec nginx bash
