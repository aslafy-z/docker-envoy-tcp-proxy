#!/bin/sh

set -e

BIND_ADDRESS=${BIND_ADDRESS:-0.0.0.0}
BIND_PORT=${BIND_PORT:-8443}
TCP_PROXY=${BIND_PORT:-8443}

[ -z "$TARGET_HOST" ] && echo "TARGET_HOST is required" && exit 1
[ -z "$TARGET_PORT" ] && echo "TARGET_PORT is required" && exit 1

sed \
  -e "s/__TMPL_BIND_ADDRESS__/$BIND_ADDRESS/g" \
  -e "s/__TMPL_BIND_PORT__/$BIND_PORT/g" \
  -e "s/__TMPL_TARGET_HOST__/$TARGET_HOST/g" \
  -e "s/__TMPL_TARGET_PORT__/$TARGET_PORT/g" \
  /usr/local/etc/envoy/config.yml.tmpl

sed '/__TMPL_BEGIN_TCP_PROXY__/,/__TMPL_END_TCP_PROXY__/d' envoy.tpl

| \
  tee /usr/local/etc/envoy/config.yml

exec envoy -c /usr/local/etc/envoy/config.yml "$@"
