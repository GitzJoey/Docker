FROM linuxserver/code-server:latest

USER root

RUN apt-get update -y && \
    apt-get install -y curl gnupg ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs jq

RUN npm install -g appwrite-cli

EXPOSE 5173

