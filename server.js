'use strict';

// Sample micro-service (dependency-free) used to exercise the DevOps
// playbooks in this repo: the Dockerfile, healthcheck script and the
// Prometheus scrape config all target its /health and /metrics endpoints.

const http = require('http');

const startedAt = Date.now();
let requestCount = 0;

function createServer() {
  return http.createServer((req, res) => {
    requestCount += 1;

    if (req.url === '/health') {
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ status: 'ok', uptime: process.uptime() }));
      return;
    }

    if (req.url === '/metrics') {
      res.writeHead(200, { 'Content-Type': 'text/plain; version=0.0.4' });
      res.end(
        [
          '# HELP http_requests_total Total HTTP requests received.',
          '# TYPE http_requests_total counter',
          `http_requests_total ${requestCount}`,
          '# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.',
          '# TYPE process_start_time_seconds gauge',
          `process_start_time_seconds ${Math.floor(startedAt / 1000)}`,
          ''
        ].join('\n')
      );
      return;
    }

    if (req.url === '/') {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(
        '<h1>DevOps Sample App</h1><p>Try the <a href="/health">/health</a> and <a href="/metrics">/metrics</a> endpoints.</p>'
      );
      return;
    }

    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'not found' }));
  });
}

const app = createServer();

if (require.main === module) {
  const port = Number(process.env.PORT) || 3000;
  app.listen(port, () => {
    console.log(`devops-sample-app listening on :${port}`);
  });
}

module.exports = app;