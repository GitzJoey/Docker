FROM lscr.io/linuxserver/webtop:latest

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        yt-dlp \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
