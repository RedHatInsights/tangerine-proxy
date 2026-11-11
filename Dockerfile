FROM registry.access.redhat.com/hi/caddy:2.11.7@sha256:1804c582fef49d8425d23343294591e506804c2b7b6965a2a2428f80501312e3

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
