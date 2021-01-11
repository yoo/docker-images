FROM postgres:13

COPY entrypoint.sh /entrypoint.sh

RUN set -x \
&& apt update -y \
&& apt install -y fscrypt \
&& chmod +x /entrypoint.sh
