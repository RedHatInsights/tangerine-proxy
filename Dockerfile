FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:fa445cd@sha256:5ebe01668e6c086adf22fe11642b8315a7f6d728bee91f3490e1f14ea7dc5494

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
