#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

cp ngrokd.service /lib/systemd/system/
mkdir -p /opt/ngrok
mkdir -p /var/log/ngrok

cp bin/ngrokd /opt/ngrok/

systemctl enable ngrokd.service
systemctl start ngrokd.service