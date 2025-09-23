FROM arm64v8/debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl sudo gnupg2 ca-certificates build-essential wget unzip git python3 python3-pip openssh-server \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=gitzjoey
RUN useradd -m -s /bin/bash $USERNAME && usermod -aG sudo $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

RUN npm install -g wetty@2.5.0

RUN mkdir /var/run/sshd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 3000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER $USERNAME
WORKDIR /home/$USERNAME

ENTRYPOINT ["/entrypoint.sh"]
