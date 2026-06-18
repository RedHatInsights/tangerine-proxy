# Tangerine Proxy

An OAuth and TLS proxy for [Tangerine Frontend][tangerine-frontend] and
[Tangerine Backend][tangerine-backend]. It provides a Caddy reverse proxy that routes requests
to the frontend and backend pods, sitting behind an OpenShift OAuth Proxy for authentication.

## How It Works

Two proxies work together:

1. **OpenShift OAuth Proxy** handles authentication and the OAuth flow
2. **Tangerine Proxy (Caddy)** runs as a reverse proxy in the same pod, routing requests to the
   frontend and backend services

This ensures both the frontend and backend are behind OAuth without either application needing to
implement the OAuth flow.

Inspired by [firelink-proxy][firelink-proxy].

## Deploying

```sh
NAMESPACE=<namespace>

oc process \
    -p COOKIE_SECRET=$(python -c 'import os,base64; print(base64.b64encode(os.urandom(16)).decode())') \
    -p HOSTNAME=<your public Route hostname> \
    -f openshift/template.yaml | oc apply -f - -n $NAMESPACE
```

## Configuration

The Caddy reverse proxy is configured via the `Caddyfile`:

- `/api/*` requests are forwarded to `BACKEND_SERVICE:BACKEND_PORT`
- All other requests are forwarded to `FRONTEND_SERVICE:FRONTEND_PORT`
- TLS is disabled (`auto_https off`) since the OAuth Proxy handles TLS termination

Environment variables used at runtime:

| Variable             | Description                          |
| -------------------- | ------------------------------------ |
| `BACKEND_SERVICE`    | Hostname of the backend service      |
| `BACKEND_PORT`       | Port of the backend service          |
| `FRONTEND_SERVICE`   | Hostname of the frontend service     |
| `FRONTEND_PORT`      | Port of the frontend service         |

## Prerequisites

- OpenShift cluster
- `oc` CLI authenticated
- Tangerine Frontend and Backend services deployed in the same namespace

## License

Apache License 2.0

[tangerine-frontend]: https://github.com/RedHatInsights/tangerine-frontend/
[tangerine-backend]: https://github.com/RedHatInsights/tangerine-backend/
[firelink-proxy]: https://github.com/RedHatInsights/firelink-proxy
