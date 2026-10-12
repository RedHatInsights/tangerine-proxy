FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:f54997c@sha256:719b2aa0afa7d92fa6d317887e6a794c205170c7e6448dc642c3bc45b66e0e9f

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
