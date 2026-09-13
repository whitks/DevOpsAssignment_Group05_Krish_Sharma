'use strict';

const { test, before, after } = require('node:test');
const assert = require('node:assert');

let app;
let baseUrl;

function request(pathname) {
  return fetch(`${baseUrl}${pathname}`);
}

before(async () => {
  app = require('./server');
  await new Promise((resolve) => app.listen(0, resolve));
  baseUrl = `http://127.0.0.1:${app.address().port}`;
});

after(() => {
  app.close();
});

test('GET / returns the landing page', async () => {
  const res = await request('/');
  assert.strictEqual(res.status, 200);
  const body = await res.text();
  assert.match(body, /DevOps Sample App/);
});

test('GET /health returns status ok', async () => {
  const res = await request('/health');
  assert.strictEqual(res.status, 200);
  const body = await res.json();
  assert.strictEqual(body.status, 'ok');
});

test('GET /metrics exposes prometheus-style metrics', async () => {
  const res = await request('/metrics');
  assert.strictEqual(res.status, 200);
  const body = await res.text();
  assert.match(body, /^# HELP http_requests_total/m);
  assert.match(body, /http_requests_total [0-9]+/);
});

test('GET /unknown returns 404 JSON', async () => {
  const res = await request('/unknown');
  assert.strictEqual(res.status, 404);
  const body = await res.json();
  assert.strictEqual(body.error, 'not found');
});