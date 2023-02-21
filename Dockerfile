ARG php=8.0

FROM php:$php-apache

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

WORKDIR /var/www/html/

COPY ./docker-php.conf /etc/apache2/conf-available/docker-php.conf

COPY ./app .

EXPOSE 80
