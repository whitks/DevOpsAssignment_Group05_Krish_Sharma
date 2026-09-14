# DevOps Automation Scripts

Reusable Bash utilities for common DevOps chores. All scripts are written
with `set -euo pipefail` (fail fast, no silent errors, sensitive to undefined
variables).

| Script | Purpose | Usage |
|--------|---------|-------|
| `backup.sh` | Archive a directory with N-day retention | `./backup.sh <src> <dest> <days>` |
| `healthcheck.sh` | Probe an HTTP endpoint and check status code | `./healthcheck.sh <url> <code> <timeout>` |
| `deploy.sh` | Rolling container deployment with rollback | `./deploy.sh <image> <name> <ports>` |
| `branch-cleanup.sh` | Remove merged local git branches | `./branch-cleanup.sh [--force]` |
| `healthcheck.ps1` | HTTP probe (PowerShell flavour for Windows) | `.\healthcheck.ps1 -Url <url>` |

## Quick start

```bash
chmod +x *.sh

./healthcheck.sh http://localhost:3000/health 200 10
./backup.sh ./shared ./backups 14
./branch-cleanup.sh --force
```

## CI-friendly usage

These scripts integrate with CI systems — e.g. in a GitHub Actions step:

```yaml
- name: Probe production
  run: ./DevOps/scripts/healthcheck.sh https://app.example.com/health 200 10

- name: Deploy service
  run: ./DevOps/scripts/deploy.sh ghcr.io/whitks/devops-assignment-group05:main devops-app 8080:3000
```

## Note

Bash scripts assume a Linux/macOS runner. On Windows CI runners, use the
matching PowerShell equivalents or the Windows Subsystem for Linux (WSL).