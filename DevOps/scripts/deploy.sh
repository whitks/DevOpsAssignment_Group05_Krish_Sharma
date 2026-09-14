#!/usr/bin/env bash
#
# deploy.sh — zero-downtime style deployment using Docker.
#
# Assumes: an image tagged with the commit SHA or version.
# Usage:   ./deploy.sh [image] [container_name] [port_map e.g. 8080:3000]

set -euo pipefail

IMAGE="${1:?usage: ./deploy.sh <image> [container_name] [port_map]}"
CONTAINER_NAME="${2:-devops-app}"
PORT_MAP="${3:-8080:3000}"

echo "[deploy] Pulling image: $IMAGE"
docker pull "$IMAGE"

echo "[deploy] Starting new container '$CONTAINER_NAME-new'"
docker run -d \
  --name "$CONTAINER_NAME-new" \
  -p "$PORT_MAP" \
  --restart unless-stopped \
  "$IMAGE"

echo "[deploy] Running health check..."
if curl -sf --max-time 15 "http://localhost:${PORT_MAP%%:*}"; then
  echo "[deploy] Health check passed. Cutting over."
else
  echo "[deploy] Health check failed. Rolling back." >&2
  docker rm -f "$CONTAINER_NAME-new" >/dev/null 2>&1 || true
  exit 1
fi

echo "[deploy] Removing old container (if any)"
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker rename "$CONTAINER_NAME-new" "$CONTAINER_NAME"

echo "[deploy] Done — $CONTAINER_NAME is running from $IMAGE"