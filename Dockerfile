FROM quay.io/redhat-services-prod/hcm-eng-prod-tenant/caddy-ubi:0d6954b

ENV CADDY_TLS_MODE="http_port 8000"

COPY ./Caddyfile /opt/app-root/src/Caddyfile

WORKDIR /opt/app-root/src

CMD ["caddy", "run", "--config", "/opt/app-root/src/Caddyfile"]
