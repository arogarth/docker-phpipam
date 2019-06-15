FROM php:7.2-apache

ARG PHPIPAM_VERSION="1.3.2"

WORKDIR /var/www/html/

RUN apt-get update \
 && apt-get install -y curl git mysql-client \
 && apt-get install -y libgmp-dev libldap2-dev libxml2-dev libpng-dev

RUN docker-php-ext-install pdo pdo_mysql session sockets gmp ldap simplexml json mbstring gd gettext

RUN a2enmod rewrite

RUN git clone https://github.com/phpipam/phpipam.git /var/www/html/ \
 && git fetch --all \
 && git checkout ${PHPIPAM_VERSION} \
 && git submodule init \
 && git submodule update 

RUN rm -rf /var/www/html/.git \
 && apt-get remove -y libgmp-dev libldap2-dev libxml2-dev libpng-dev 

COPY config.php /var/www/html/config.php
