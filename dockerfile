FROM alpine
RUN apk add --no-cache ca-certificates &&\
    wget -O - https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | unzip - &&\
    chmod +x /xray

ADD ./etc/xray.json /xray.json
ADD ./etc/caddyfile /etc/caddy/caddyfile

CMD sed -i "s/\$UUID/$UUID/g" xray.json &&\
    sed -i "s/\$UUID/$UUID/g" /etc/caddy/caddyfile &&\
    /xray -c /xray.json &&\
    caddy run --config /etc/caddy/Caddyfile
