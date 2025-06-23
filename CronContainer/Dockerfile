FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*

# Reset DEBIAN_FRONTEND to avoid issues with other apps
ENV DEBIAN_FRONTEND=

RUN touch /var/log/cron.log && chmod 666 /var/log/cron.log

COPY crontab /etc/cron.d/container-cron

RUN chmod 0644 /etc/cron.d/container-cron && crontab /etc/cron.d/container-cron

CMD ["cron", "-f"]

