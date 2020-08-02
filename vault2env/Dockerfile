FROM alpine:latest AS builder

ENV VAULT2ENV_VERSION=v2.0.0

RUN set -x \
 && apk add --update curl gzip tar \
 && curl -L https://github.com/Luzifer/vault2env/releases/download/${VAULT2ENV_VERSION}/vault2env_linux_amd64.tar.gz | tar -xzC /

FROM alpine:latest

COPY --from=builder /vault2env_linux_amd64 /usr/bin/vault2env

RUN set -x \
 && apk add --update --no-cache dumb-init ca-certificates \
 && adduser -D vault2env
 
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/bin/vault2env"]

