FROM lscr.io/linuxserver/webtop:debian-xfce

USER root

RUN apt-get update && \
    apt-get install -y git wget gnupg software-properties-common apt-transport-https curl

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/ms-vscode.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get install -y code

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL custom_build_by="gitzjoey"
