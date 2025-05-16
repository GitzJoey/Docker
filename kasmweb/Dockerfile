FROM kasmweb/desktop:1.17.0

USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# Update & Upgrade
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl gnupg ca-certificates software-properties-common

# Install gnome-keyring
RUN apt-get update && \
    apt-get install -y gnome-keyring && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add sudo and grant kasm-user passwordless access
RUN apt-get update && \
    apt-get install -y sudo && \
    echo "kasm-user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kasm-user && \
    chmod 0440 /etc/sudoers.d/kasm-user

# Install VS Code
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get update && \
    apt-get install -y code && \
    rm microsoft.gpg

# Install Windsurf
RUN curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" \
    | gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" \
    > /etc/apt/sources.list.d/windsurf.list && \
    apt-get update && \
    apt-get install -y windsurf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js v22 and npm
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Clean up again
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
