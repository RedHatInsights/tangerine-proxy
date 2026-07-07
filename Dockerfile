FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:fa445cd@sha256:c5c68fdf287b3f7ef4a415af2f1a32ad229f374a8cdba2d2a92b900bbb1fc1c5

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
