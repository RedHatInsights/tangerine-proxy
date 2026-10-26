FROM registry.access.redhat.com/hi/caddy:2.11.7@sha256:33446d9652c22f3378fbf0820ca13500ded31ae67fa6328571ad87f093029017

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
