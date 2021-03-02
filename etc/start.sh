#!/bin/sh

wget -qO- $CONFIGCADDY | sed -e "1c :$PORT" -e "s/\$UUID/$UUID/g" -e "s/\$MYUUID-HASH/$(caddy hash-password --plaintext $UUID)/g" > /etc/caddy/Caddyfile
wget -qO- $CONFIGXRAY | sed -e "s/\$UUID/$UUID/g" -e "s/\$ParameterSSENCYPT/$ParameterSSENCYPT/g" > /xray.json

/xray -config /xray.json
caddy run --config /etc/caddy/caddyfile
