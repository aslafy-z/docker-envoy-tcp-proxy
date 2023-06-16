FROM envoyproxy/envoy:v1.26-latest

COPY config.yml.tmpl /usr/local/etc/envoy/config.yml.tmpl
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
