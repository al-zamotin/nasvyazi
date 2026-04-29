include .env
export

.PHONY: up down restart install build ps logs migrate shell-core shell-web shell-db clean

# Start project
up:
	docker compose up -d

# Stop project
down:
	docker compose down

# Restart project
restart: down up

# Install dependencies
install:
	docker exec -it ${PROJECT_NAME}_core composer install
	docker exec -it ${PROJECT_NAME}_web npm install

# Transfer images & run
build:
	docker compose up -d --build

# View containers status
ps:
	docker compose ps

# View logs
logs:
	docker compose logs -f

# Generate laravel app key
key:
	docker exec -it ${PROJECT_NAME}_core php artisan key:generate

# Full initial setup for laravel
setup-core:
	docker exec -it ${PROJECT_NAME}_core composer install
	docker exec -it ${PROJECT_NAME}_core php artisan key:generate
	docker exec -it ${PROJECT_NAME}_core php artisan migrate


# Database migrate
migrate:
	docker exec -it ${PROJECT_NAME}_core php artisan migrate

# Go to laravel terminal
shell-core:
	docker exec -it ${PROJECT_NAME}_core sh

# Go to react terminal
shell-web:
	docker exec -it ${PROJECT_NAME}_web sh

# Go to database terminal
shell-db:
	docker exec -it ${PROJECT_NAME}_postgres psql -U ${DB_USERNAME} -d ${DB_DATABASE}

# Clean docker resources
clean:
	docker system prune -f
