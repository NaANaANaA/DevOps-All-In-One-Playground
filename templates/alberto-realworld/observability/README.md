# Observability starter

A ready-to-run local observability stack using Prometheus, Grafana, and Node Exporter. If you want file-based credentials, copy `.env.example` to `.env` before running `docker compose`; otherwise export the password for the current shell session.

## Start

```bash
export GRAFANA_ADMIN_PASSWORD="$(openssl rand -hex 16)"
docker compose up -d
```

## Stop

```bash
docker compose down -v
```

## Endpoints

- Grafana: <http://localhost:3000>
- Prometheus: <http://localhost:9090>
- Node Exporter: <http://localhost:9100/metrics>
