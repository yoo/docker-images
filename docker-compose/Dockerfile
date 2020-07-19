FROM vault:latest as vault

FROM quay.io/johannweging/vault2env as vault2env

FROM alpine:edge

RUN set -x\ 
	&& apk add --update --no-cache docker-compose docker openssh make jsonnet py3-pip bash \
	&& pip3 install invoke

COPY --from=vault /bin/vault /usr/bin/vault

COPY --from=vault2env /usr/bin/vault2env /usr/bin/vault2env

COPY ssh_config /root/.ssh/config
