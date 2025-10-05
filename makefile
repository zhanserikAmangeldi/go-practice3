
ifneq (,$(wildcard .env))
	include .env
	export
endif

POSTGRES_USER ?= myuser
POSTGRES_PASSWORD ?= mypassword
POSTGRES_DB ?= mydatabase
DB_SERVICE = db
POSTGRES_PORT ?= 5432

MIGRATIONS_DIR = internal/db/migrations
MIGRATE_CLI = migrate
DC = docker-compose
MIGRATE_SERVICE = migrate

# In Docker container
migrate-up:
	@echo "Running migrate up via Docker service..."
	$(DC) up migrate

migrate-down:
	@echo "Running migrate down via Docker service..."
	$(DC) run --rm $(MIGRATE_SERVICE) migrate -path=/migrations -database "postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@$(DB_SERVICE):5432/$(POSTGRES_DB)?sslmode=disable" down

# Local
migrate-up-local:
	@echo "Running migrate up locally..."
	$(MIGRATE_CLI) -path $(MIGRATIONS_DIR) -database "postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:$(POSTGRES_PORT)/$(POSTGRES_DB)?sslmode=disable" up

migrate-down-local:
	@echo "Running migrate down locally..."
	$(MIGRATE_CLI) -path $(MIGRATIONS_DIR) -database "postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:$(POSTGRES_PORT)/$(POSTGRES_DB)?sslmode=disable" down