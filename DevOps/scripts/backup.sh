#!/usr/bin/env bash
#
# backup.sh — incremental archive of a directory with retention policy.
#
# Usage: ./backup.sh [source_dir] [destination_dir] [days_to_keep]

set -euo pipefail

SOURCE_DIR="${1:-./shared}"
DEST_DIR="${2:-./backups}"
RETENTION_DAYS="${3:-14}"

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_NAME="backup-${TIMESTAMP}.tar.gz"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "[backup] ERROR: source directory '$SOURCE_DIR' does not exist" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

echo "[backup] Archiving '$SOURCE_DIR' -> '$DEST_DIR/$BACKUP_NAME'"
tar -czf "$DEST_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

echo "[backup] Removing backups older than ${RETENTION_DAYS} days"
find "$DEST_DIR" -type f -name "backup-*.tar.gz" -mtime "+${RETENTION_DAYS}" -print -delete

echo "[backup] Done. Available backups:"
ls -lh "$DEST_DIR"