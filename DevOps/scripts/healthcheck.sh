#!/usr/bin/env bash
#
# healthcheck.sh — verify an HTTP service responds and report exit code.
#
# Usage: ./healthcheck.sh [url] [expected_http_code] [timeout_seconds]

set -euo pipefail

URL="${1:-http://localhost:3000/health}"
EXPECTED_CODE="${2:-200}"
TIMEOUT="${3:-10}"

echo "[healthcheck] Checking $URL (expect HTTP $EXPECTED_CODE, timeout ${TIMEOUT}s)"

HTTP_CODE="$(curl -sS -o /dev/null -w '%{http_code}' \
  --max-time "$TIMEOUT" \
  -H 'Connection: keep-alive' \
  "$URL" || echo "000")"

if [[ "$HTTP_CODE" == "$EXPECTED_CODE" ]]; then
  echo "[healthcheck] OK — got HTTP $HTTP_CODE"
  exit 0
else
  echo "[healthcheck] FAIL — got HTTP $HTTP_CODE, expected $EXPECTED_CODE" >&2
  exit 1
fi