#!/bin/bash

if [ "$DEBUG" = "true" ] || [ "$DEBUG" = "True" ]; then
    set -x
    set -o functrace
fi

set -e
shopt -s extglob

if [ -e "/data/requirements.txt" ]; then
    echo "Found requirements.txt"
    pip install --no-cache-dir -r /data/requirements.txt
fi

if [ ! -e "/data/botserverrc" ]; then
    echo "[WARN] File \"botserverrc\" not found."
    touch /data/botserverrc
    chmod 600 /data/botserverrc
fi

if [ ! -e "/data/bot.conf" ]; then
    echo "[WARN] File \"bot.conf\" not found."
    touch /data/bot.conf
    chmod 600 /data/bot.conf
fi

zulip-botserver --config-file /data/botserverrc --bot-config-file /data/bot.conf --hostname $HOSTNAME
