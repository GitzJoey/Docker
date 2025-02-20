# Use official PHP 8.2 Apache image as the base
FROM php:8.2-apache

# Update system and install required packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libcurl4-openssl-dev \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libgmp-dev \
    && docker-php-ext-install \
    curl \
    mysqli \
    pdo_mysql \
    opcache \
    zip \
    intl \
    gd \
    gmp \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
