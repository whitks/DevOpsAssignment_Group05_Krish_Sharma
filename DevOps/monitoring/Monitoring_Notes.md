# Monitoring and Observability — DevOps Notes

## Monitoring vs Observability

- **Monitoring** — collecting and visualizing known signals: metrics, logs,
  availability, and alerting when something is out of bounds.
- **Observability** — the ability to ask *new* questions about a system from
  its outputs (metrics, logs, traces) without shipping new code.

The three pillars of observability:

1. **Metrics** — numeric measurements (request count, latency, CPU).
2. **Logs** — timestamped events (structured or plain text).
3. **Traces** — the path of one request across distributed services.

---

## The Golden Signals

Google's SRE book defines four golden signals:

| Signal | Question it answers |
|--------|---------------------|
| Latency | How long does a request take? |
| Traffic | How much demand is on the system? |
| Errors | How many requests are failing? |
| Saturation | How full is the system? |

---

## Core Toolchain: Prometheus + Grafana

### Prometheus

Prometheus is a pull-based time-series database and alerting tool.

```bash
# health
http://localhost:9090/targets

# it scrapes targets defined in prometheus.yml
scrape_interval: 15s
```

Key concepts:

- **Targets** — endpoints to scrape (`/metrics`).
- **Metrics** — time-series values with labels.
- **Rules** — recording and alerting rules.
- **Alertmanager** — routing/deduplicating alerts to Slack, email, PagerDuty.

### Grafana

Grafana visualizes Prometheus data on dashboards.

```bash
# run grafana via compose (see DevOps/docker/docker-compose.yml)
docker compose up -d grafana
# open http://localhost:3000  (admin / $GF_ADMIN_PASSWORD)
```

### node-exporter & cAdvisor

- **node-exporter** exposes host OS metrics (CPU, memory, disk, network).
- **cAdvisor** exposes per-container usage metrics.

---

## Common Queries (PromQL)

```promql
# request rate per second, per status class
sum(rate(http_requests_total[5m])) by (status)

# 90th percentile latency
histogram_quantile(0.9, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))

# container CPU %
sum(rate(container_cpu_usage_seconds_total[5m])) by (container)

# targets currently down
up == 0
```

---

## Logging Pipeline

A typical stack: app → Fluentd/Fluent Bit → (Kafka) → Elasticsearch → Kibana,
or the lighter Grafana stack: Promtail → Loki → Grafana.

### Logging best practices

- Log in **structured format** (JSON) so fields are queryable.
- Never log **passwords, tokens or PII**.
- Add request IDs to correlate logs and traces.
- Keep logs in a **separate store** from application state.

---

## Alerting Best Practices

1. Alert on **symptoms**, not causes (alert "pages failing", not "CPU high").
2. Every alert has a title, meaning, and next action.
3. Avoid alert fatigue — use `for:` durations to confirm sustained problems.
4. Route by severity: `warning` → Slack, `critical` → phone.
5. Review and tune alerts regularly (about monthly).

---

## SLIs, SLOs and SLAs

- **SLI** — measurement of reliability (e.g. 99.9% of requests < 300 ms).
- **SLO** — target for that measurement (e.g. 99.9% latency SLI).
- **SLA** — contractual commitment to a customer.

SLOs drive alerting: page the team *before* the SLO is breached.

---

## Files in this folder

- `prometheus.yml` — scrape targets and global settings.
- `alert-rules.yml` — alerting rules (error rate, instance down, disk, CPU).
- `grafana-datasource.yml` — Grafana provisioning for the Prometheus datasource.

---

## References

- [Prometheus Documentation](https://prometheus.io/docs/)
- [PromQL examples](https://prometheus.io/docs/prometheus/latest/querying/examples/)
- [Grafana Documentation](https://grafana.com/docs/)
- [SRE book — Google](https://sre.google/sre-book/table-of-contents/)