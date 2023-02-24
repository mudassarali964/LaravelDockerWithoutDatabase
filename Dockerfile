FROM php:8.1.0-apache
WORKDIR /var/www/html

# Mode Rewrite
RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y libicu-dev unzip zip

# Composer
# RUN apt-get install composer -y
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install gettext intl pdo_mysql