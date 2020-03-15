FROM fluent/fluentd:edge

USER root

RUN set -x \
&& apk add --no-cache --update --virtual .deps sudo build-base ruby-dev \
&& gem install fluent-plugin-elasticsearch \
&& gem install fluent-plugin-kubernetes_metadata_filter \
&& gem install fluent-plugin-detect-exceptions \
&& gem install fluent-plugin-concat \
&& gem sources --clear-all \
&& apk del .deps \
&& rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem 

COPY init.sh  /
RUN chmod +x /init.sh

USER fluent

ENTRYPOINT [ "tini", "--", "/init.sh" ]
CMD ["fluentd"]
