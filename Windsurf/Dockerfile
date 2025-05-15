FROM lscr.io/linuxserver/webtop:debian-xfce

USER root

RUN curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" \
    | gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" \
    > /etc/apt/sources.list.d/windsurf.list && \
    apt-get update && \
    apt-get install -y windsurf git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get upgrade -y windsurf
