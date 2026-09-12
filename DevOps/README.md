# DevOps Index

Everything in the repository related to DevOps, organized one level deep.

> Start here — this index links to every DevOps playbook, manifest, config and script in the repo.

## Contents

| Area | Description | Where |
|------|-------------|-------|
| **CI/CD** | GitHub Actions guide + real workflows | [ci-cd/](ci-cd/GitHub_Actions_Guide.md) |
| **Docker** | Containerization guide + example stack | [docker/](docker/Docker_Basics.md) |
| **Kubernetes** | Orchestration notes + manifests | [kubernetes/](kubernetes/Kubernetes_Basics.md) |
| **IaC** | Terraform notes + HCL provisionable infra | [iac/](iac/Terraform_Notes.md) |
| **Monitoring** | Prometheus, alert rules, Grafana setup | [monitoring/](monitoring/Monitoring_Notes.md) |
| **Cloud** | AWS services for DevOps + Lambda sample | [cloud/](cloud/AWS_DevOps_Notes.md) |
| **Scripts** | Bash/PowerShell automation utilities | [scripts/](scripts/README.md) |
| **Linux** | Daily production commands cheat sheet | [linux/](linux/Linux_DevOps_Commands.md) |
| **Best Practices** | DORA-driven engineering checklist | [best-practices/](best-practices/Best_Practices.md) |
| **Glossary** | A–Z of DevOps terminology | [glossary/](glossary/DevOps_Glossary.md) |
| **Security** | DevSecOps shift-left playbook | [security/](security/DevSecOps_Basics.md) |
| **Learning Path** | Ordered road-map to become DevOps-ready | [learning-path.md](learning-path.md) |

## CI/CD workflows

| File | Purpose |
|------|---------|
| `.github/workflows/ci.yml` | CI: lint, test, security scan on push/PR |
| `.github/workflows/deploy.yml` | CD: build image, push to GHCR, deploy on tag |

## Quick reference

```bash
# Validate a compose stack
docker compose config

# Dry-run a terraform plan
cd iac/terraform && terraform plan

# Smoke-test a service
./scripts/healthcheck.sh http://localhost:3000/health 200 10

# Clean merged branches
./scripts/branch-cleanup.sh --force
```

## Conventions

- Markdown notes: `##` heading per topic, tables for quick scanning.
- YAML manifests: match Kubernetes v1 APIs and pin action major versions.
- Scripts: `set -euo pipefail`, argument defaults, friendly echo output.
- IaC: never commit `terraform.tfstate` or `.terraform/`.

## Related material (existing repo folders)

- `Notes/` — session notes (Git, Docker, Databricks).
- `CheatSheet/` — Git cheat sheet and DevOps reference.
- `PPT/` — presentation decks.
- `Assignments/` & `DPP/` & `WeeklyTasks/` — practical coursework.