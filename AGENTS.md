# Tangerine Proxy

## Project Overview

Tangerine Proxy is a Caddy-based reverse proxy that routes requests to the Tangerine Frontend and
Backend services. It runs behind an OpenShift OAuth Proxy to provide authentication without either
application implementing the OAuth flow. Deployed as a container on OpenShift.

## Dependencies

- **Runtime:** Caddy (via UBI-based container image)
- **Infrastructure:** OpenShift cluster, OpenShift OAuth Proxy
- **Deployment:** `oc` CLI

## Development Commands

```sh
# Deploy to OpenShift
oc process \
    -p COOKIE_SECRET=$(python -c 'import os,base64; print(base64.b64encode(os.urandom(16)).decode())') \
    -p HOSTNAME=<hostname> \
    -f openshift/template.yaml | oc apply -f - -n <namespace>
```

There is no build system, test suite, or CI/CD pipeline beyond the Dockerfile.

## Architecture

The repository contains three key files:

- `Caddyfile` — reverse proxy configuration routing `/api/*` to the backend and everything else
  to the frontend
- `Dockerfile` — builds the container from a UBI-based Caddy image
- `openshift/` — OpenShift deployment templates

No application code exists. The Caddy configuration uses environment variables for service
discovery at runtime.

## Code Style

- Caddyfile uses standard Caddy directive syntax
- Dockerfile is minimal (3 lines: base image, env var, config copy)
- OpenShift templates use standard `oc process` parameter substitution

## Common Mistakes

1. **Forgetting environment variables.** The Caddyfile references `BACKEND_SERVICE`,
   `BACKEND_PORT`, `FRONTEND_SERVICE`, and `FRONTEND_PORT` at runtime. If these are not set in
   the pod environment, Caddy will fail to start.

2. **Enabling TLS in Caddy.** The `auto_https off` directive is intentional. TLS termination is
   handled by the OAuth Proxy, not Caddy. Enabling Caddy TLS will break the proxy chain.

3. **Changing the listen port.** Caddy listens on `:8000` which must match the OAuth Proxy's
   upstream configuration. Changing it without updating the OAuth Proxy config will break routing.
