# Observability starter

A ready-to-run local observability stack using Prometheus, Grafana, and Node Exporter.

## Start

```bash
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
