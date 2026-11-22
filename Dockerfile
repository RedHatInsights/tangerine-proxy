FROM registry.access.redhat.com/hi/caddy:2.11.7@sha256:a72c296195eed0128c2ac7ffe920d8e78d69c24de4181631176c19fcce4c9b52

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /etc/caddy/Caddyfile
