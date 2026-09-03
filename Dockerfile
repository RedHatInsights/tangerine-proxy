FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:fa445cd@sha256:a79d0795dade137dfec8bf6b6d1fde2fcb7f50f3

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
