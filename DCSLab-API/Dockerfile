# Use an official PHP with Apache image
FROM php:8.2-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    composer \
    mariadb-client \
    cron \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && apt-get clean

# Set working directory
WORKDIR /var/www/html

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable mod_rewrite for Apache
RUN a2enmod rewrite

# Add a cron job to update from GitHub daily
RUN echo "0 2 * * * root cd /var/www/html && git pull origin main" >> /etc/crontab

# Start Apache and cron in the background
CMD service cron start && apache2-foreground
