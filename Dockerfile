FROM registry.access.redhat.com/hi/caddy:2.11.7@sha256:443cd9a7d6a8ca9db519903582810d2b633646f3a6a25029530d0a5c0135dcb5

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
