COMPOSE=docker compose -f compose.yml --env-file docker/.env.local

composer.install:
	$(COMPOSE) exec php-fpm composer install

db.migrate:
	$(COMPOSE) exec php-fpm php bin/console doctrine:migrations:migrate -n

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
