COMPOSE=docker compose -f compose.yml --env-file docker/.env.local

composer.install:
	composer install

migration:
	php bin/console make:migration

migrate:
	bin/console doctrine:migrations:migrate -n

entity:
	php bin/console make:entity

list:
	php bin/console list make

crud:
	php bin/console make:crud

user:
	php bin/console make:user

registration:
	php bin/console make:registration-form

login:
	php bin/console make:security:form-login

docker.build: docker.stop
	$(COMPOSE) build --no-cache

docker.rebuild: docker.stop
	$(COMPOSE) up -d --build

docker.remove:
	$(COMPOSE) down --remove-orphans

docker.restart: docker.stop docker.start

docker.start:
	$(COMPOSE) up -d

docker.stop:
	$(COMPOSE) down

shell.mysql:
	$(COMPOSE) exec mysql bash

shell.nginx:
	$(COMPOSE) exec nginx sh

shell.php:
	$(COMPOSE) exec php-fpm sh

yarn.build:
	$(COMPOSE) exec php-fpm yarn build

yarn.dev:
	$(COMPOSE) exec php-fpm yarn dev

yarn.install:
	$(COMPOSE) exec php-fpm yarn install

yarn.watch:
	$(COMPOSE) exec php-fpm yarn watch
