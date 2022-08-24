up:
	docker compose up
build:
	docker compose build
stop:
	docker compose stop
down:
	docker compose down
down-all:
	docker compose down --rmi all --volumes
delete-db:
	rm -rf ./docker/db/data
	rm -rf ./docker/db/log
clear-log:
	echo -n > ./docker/php/var/php-error.log
init:
	cp .env.sample .env
	cp docker/bedrock/.env.sample docker/bedrock/.env.development
	touch docker/php/var/php-error.log
	docker compose up -d
	docker compose exec php composer install
destroy:
	@make down
	@make clear-log
	@make delete-db
	rm -rf src/web/app/uploads/*
	rm -rf src/web/app/languages/*
wp:
	docker compose exec php bash
