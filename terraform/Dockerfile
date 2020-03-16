FROM golang:alpine AS gandi

RUN set -x \
&& apk add --update git \
&& mkdir -p ${GOPATH}/src/github.com/tiramiseb \
&& cd ${GOPATH}/src/github.com/tiramiseb \
&& git clone https://github.com/tiramiseb/terraform-provider-gandi.git \
&& cd terraform-provider-gandi \
&& go build -o terraform-provider-gandi \
&& chmod +x terraform-provider-gandi \
&& mv terraform-provider-gandi /

FROM vault:latest as vault

FROM quay.io/johannweging/vault2env as vault2env

FROM hashicorp/terraform:latest

RUN set -x \
&& mkdir -p ${HOME}/.terraform.d/plugins 

COPY --from=gandi /terraform-provider-gandi /root/.terraform.d/plugins/terraform-provider-gandi

COPY --from=vault /bin/vault /usr/bin/vault

COPY --from=vault2env /usr/bin/vault2env /usr/bin/vault2env
