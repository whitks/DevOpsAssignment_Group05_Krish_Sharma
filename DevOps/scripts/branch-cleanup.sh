#!/usr/bin/env bash
#
# branch-cleanup.sh — delete merged local branches (dry-run first).
#
# Usage:
#   ./branch-cleanup.sh          # dry run — lists what would be deleted
#   ./branch-cleanup.sh --force  # actually delete merged branches

set -euo pipefail

MAIN_BRANCH="$(git remote show origin 2>/dev/null \
  | awk '/HEAD branch/ {print $NF}' \
  | sed 's/.* //g')"
MAIN_BRANCH="${MAIN_BRANCH:-main}"

MERGED="$(git branch --merged "$MAIN_BRANCH" \
  | grep -vE '^\*|(- )?'"$MAIN_BRANCH"'$|master$')"

if [[ -z "$MERGED" ]]; then
  echo "[branch-cleanup] No merged branches to clean."
  exit 0
fi

echo "[branch-cleanup] Merged branches detected:"
echo "$MERGED" | sed 's/^/  /'

if [[ "${1:-}" == "--force" ]]; then
  echo "[branch-cleanup] Deleting locally:"
  echo "$MERGED" | while read -r branch; do
    [[ -n "$branch" ]] && git branch -d "$branch" && echo "  deleted -> $branch"
  done
  echo "[branch-cleanup] Also pruning remote refs:"
  git remote prune origin || true
else
  echo "[branch-cleanup] Dry run — pass --force to delete."
fi