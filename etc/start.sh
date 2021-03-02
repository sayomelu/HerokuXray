#!/bin/sh

sed -e "s/\$UUID/$UUID/g" /xray.json

/xray -config /xray.json
