FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    cron \
    curl \
    git \
    unzip \
    php \
    php-cli \
    php-common \
    php-mbstring \
    php-xml \
    php-zip \
    php-curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create directory for application
RUN mkdir -p /var/www/html

# Set working directory
WORKDIR /var/www/html
