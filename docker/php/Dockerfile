FROM php:8.1-fpm-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ARG ENVIRONMENT

# timezone environment
ENV TZ=UTC \
  # locale
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8 \
  # composer environment
  COMPOSER_ALLOW_SUPERUSER=1 \
  COMPOSER_HOME=/composer

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

# Initial setup
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -q -y install default-mysql-client
RUN docker-php-ext-install pdo_mysql mysqli

# # mod_rewriteを有効にする
# RUN a2enmod rewrite

# # install modules
# RUN apt-get -y install libxml2-dev
# RUN docker-php-ext-install \
#         mbstring \
#         json \
#         simplexml \
#         dom \
#         fileinfo \
#         hash \
#         xml \
#         iconv
# RUN apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libmcrypt-dev \
#         libpng-dev \
#         mailutils \
#         memcached \
#         msmtp \
#         msmtp-mta \
#         openssl

# RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
# RUN docker-php-ext-install -j$(nproc) gd exif

RUN apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8 && localedef -f UTF-8 -i en_US en_US.UTF-8

RUN mkdir /var/run/php-fpm

RUN docker-php-ext-install intl pdo_mysql zip bcmath

RUN composer config -g process-timeout 3600 && \
  composer config -g repos.packagist composer https://packagist.org
