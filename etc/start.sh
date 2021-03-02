#!/bin/sh

sed "s/\$UUID/$UUID/g" xray.json > config.json

./xray
