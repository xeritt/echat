# ************************************* #
FROM php:8.4-fpm-alpine AS php_build

ARG XDEBUG

RUN apk add postgresql-dev
RUN docker-php-ext-install -j$(nproc) intl pdo pdo_pgsql

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk del $PHPIZE_DEPS

COPY --from=composer /usr/bin/composer /usr/local/bin/composer
RUN composer self-update -vvv && chmod 777 /tmp

RUN apk add git
RUN apk add make
RUN apk add bash

WORKDIR /app
# ************************************* #
FROM php_build AS php_fpm
