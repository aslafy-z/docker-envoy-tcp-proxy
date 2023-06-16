#!/bin/sh

sed \
  -e "s/__TMPL_BIND_ADDRESS__/$BIND_ADDRESS/g" \
  -e "s/__TMPL_BIND_PORT__/$BIND_PORT/g" \
  -e "s/__TMPL_TARGET_HOST__/$TARGET_HOST/g" \
  -e "s/__TMPL_TARGET_PORT__/$TARGET_PORT/g" \
  /usr/local/etc/envoy/config.yml.tmpl | \
  tee /usr/local/etc/envoy/config.yml

exec envoy -c /usr/local/etc/envoy/config.yml "$@"
