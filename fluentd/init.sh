#!/bin/sh

if [ -n "${FLUENTD_ENV_CONF}" ]; then
	echo -e "${FLUENTD_ENV_CONF}" > /fluentd/etc/fluent_env.conf
	set -- -c /fluentd/etc/fluent_env.conf
fi

/bin/entrypoint.sh "$@"
