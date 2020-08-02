FROM alpine:latest 

RUN set -x \
&& apk add --update ansible py3-pip dumb-init ca-certificates openssh-keygen \
&& pip install ansible-modules-hashivault 

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "ansible-playbook" ]
