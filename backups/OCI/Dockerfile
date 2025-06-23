FROM ubuntu:latest

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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY app /app

RUN cd /app && composer install

COPY cron /etc/cron.d/cron
RUN chmod 644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron

CMD ["cron", "-f"]

WORKDIR /app
