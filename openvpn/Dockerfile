FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN set -x \
&& apk add --update --no-cache openvpn \
&& chmod +x /entrypoint.sh

ENV OVPN_CONFIG=/etc/openvpn/config/server.conf
ENTRYPOINT [ "/entrypoint.sh" ] 
