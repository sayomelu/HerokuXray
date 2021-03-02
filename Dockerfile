FROM alpine
RUN apk add --no-cache ca-certificates caddy &&\
    wget -O - https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | unzip - &&\
    chmod +x /xray
ADD etc/start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
