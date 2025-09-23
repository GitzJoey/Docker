#!/bin/bash
if [ -n "$PASSWORD" ]; then
    echo "gitzjoey:$PASSWORD" | sudo chpasswd
fi

sudo /usr/sbin/sshd
exec wetty --host 0.0.0.0 --port 3000 --ssh-host 127.0.0.1 --base /
