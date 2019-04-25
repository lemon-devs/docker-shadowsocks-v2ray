#!/bin/bash

if [ -z "$SS_PWD" ]; then
    echo >&2 '  You need to specify SS_PWD'
    exit 1
fi

ss-server -s 0.0.0.0 -p 80 -m chacha20-ietf-poly1305 -k "$SS_PWD" --plugin v2ray-plugin --plugin-opts "server;"
