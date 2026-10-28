FROM registry.access.redhat.com/hi/caddy:2.11.7@sha256:a6e3943eadee8926586733bb5646c2ea57189b4d0a88ac0a1d7c8d86d8f5c00b

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
