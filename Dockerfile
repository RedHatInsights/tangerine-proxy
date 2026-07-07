FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:fa445cd4ecee147760ca8e3da8c519213ae9a738

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
