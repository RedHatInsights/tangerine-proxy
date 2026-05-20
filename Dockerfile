FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:ba24e49@sha256:bcdcda167c46439356640b50c3ecfb23486037ee5bc04103b46f81c9fc587e60

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
