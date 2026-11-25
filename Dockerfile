FROM registry.access.redhat.com/hi/caddy:2.11.8@sha256:e8cc32ec0044dd7fea9acf1084f4d0efbd7a0e220e51cc16e395199c7fcc8574

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
