#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

cp ngrok.service /lib/systemd/system/
mkdir -p /opt/ngrok
mkdir -p /var/log/ngrok

cp bin/ngrok /opt/ngrok/

systemctl enable ngrok.service
systemctl start ngrok.service