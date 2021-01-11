FROM postgres:13-alpine

ENV FSCRYPT_VERSION=0.2.9

RUN set -x \
&& apk add --update --no-cache --virtual .deps go git make m4 linux-pam-dev \
&& git clone https://github.com/google/fscrypt.git /tmp/fscrypt \
&& git -C /tmp/fscrypt checkout v${FSCRYPT_VERSION} \
&& make -C /tmp/fscrypt install \
&& apk del .deps

COPY entrypoint.sh /entrypoint.sh

RUN set -x \
&& apk add --no-cache e2fsprogs-extra linux-pam \
&& chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
