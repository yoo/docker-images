#!/bin/sh

mkdir -p /dev/net

test -c /dev/net/tun || mknod /dev/net/tun c 10 200

exec openvpn --config "${OVPN_CONFIG}"
