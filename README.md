# docker-envoy-tcp-proxy

A simple Envoy container that templates a basic TCP proxy configuration.

Find Docker image at <https://github.com/aslafy-z/docker-envoy-tcp-proxy/pkgs/container/envoy-tcp-proxy>.

## Environment variables

| Variable | Default | Description |
| --- | --- | --- |
| `BIND_ADDRESS` | `0.0.0.0` | IP address to bind to |
| `BIND_PORT` | `443` | Port to bind to |
| `TARGET_HOST` | - | Host to proxy to |
| `TARGET_PORT` | - | Port to proxy to |
| `PROXY_PROTOCOL` | `0` - disabled | Enable [Proxy protocol](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/other_features/ip_transparency#proxy-protocol) |
| `ADMIN_ENDPOINT` | `0` - disabled | Enable [Admin endpoint](https://www.envoyproxy.io/docs/envoy/latest/operations/admin#operations-admin-interface) |
| `ADMIN_ADDRESS` | `0.0.0.0` | IP address to admin endpoint to |
| `ADMIN_PORT` | `443` | Port to bind admin endpoint to |
