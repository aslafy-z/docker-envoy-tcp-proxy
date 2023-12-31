#!/bin/sh

set -e

BIND_ADDRESS=${BIND_ADDRESS:-0.0.0.0}
BIND_PORT=${BIND_PORT:-8443}
PROXY_PROTOCOL=${PROXY_PROTOCOL:-0}

[ -z "$TARGET_HOST" ] && echo "TARGET_HOST is required" && exit 1
[ -z "$TARGET_PORT" ] && echo "TARGET_PORT is required" && exit 1

cp /usr/local/etc/envoy/config.yml.tmpl /usr/local/etc/envoy/config.yml

sed -i \
  -e "s/__TMPL_BIND_ADDRESS__/$BIND_ADDRESS/g" \
  -e "s/__TMPL_BIND_PORT__/$BIND_PORT/g" \
  -e "s/__TMPL_TARGET_HOST__/$TARGET_HOST/g" \
  -e "s/__TMPL_TARGET_PORT__/$TARGET_PORT/g" \
  /usr/local/etc/envoy/config.yml

if [ "$PROXY_PROTOCOL" = 0 ]; then
  sed -i \
    -e "/__TMPL_BEGIN_PROXY_PROTOCOL__/,/__TMPL_END_PROXY_PROTOCOL__/d" \
    /usr/local/etc/envoy/config.yml
else
  sed -i \
    -e "/__TMPL_BEGIN_PROXY_PROTOCOL__/d" \
    -e "/__TMPL_END_PROXY_PROTOCOL__/d" \
    /usr/local/etc/envoy/config.yml
fi

cat /usr/local/etc/envoy/config.yml

exec envoy -c /usr/local/etc/envoy/config.yml "$@"
