FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:fa445cd@sha256:b638a80e1b1e561bd9006354044957fbf2888ef7a0d4607db80d4007379f7a07

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
