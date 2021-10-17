FROM php:7.4-apache

RUN apt-get update -y && apt-get install -y \
    libpng-dev libpq-dev libzip-dev \
    mariadb-client postgresql-client \
    git netcat unzip zip gpg \
    ca-certificates curl wget gnupg dirmngr xz-utils libatomic1 \
    --no-install-recommends

RUN mkdir -p /web/html

RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
RUN docker-php-ext-install -j$(nproc) bcmath exif gd opcache pcntl pdo_mysql pdo_pgsql pgsql zip

COPY php/php.ini /usr/local/etc/php/conf.d/web.ini
COPY php/opcache.ini /etc/php7/conf.d/00_opcache.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY apache/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY apache/apache.conf /etc/apache2/conf-available/z-app.conf

RUN a2enmod rewrite remoteip
RUN a2enconf z-app

ENV NVM_DIR="/web/nvm"

RUN mkdir -p $NVM_DIR

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
