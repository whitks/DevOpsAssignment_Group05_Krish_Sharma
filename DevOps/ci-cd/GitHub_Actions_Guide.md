# CI/CD with GitHub Actions — Complete Guide

## What is CI/CD?

CI/CD stands for **Continuous Integration / Continuous Delivery (Deployment)**.
It is a set of practices that automate the build, test and release stages of
software development, enabling teams to deliver changes faster and with
higher confidence.

### Continuous Integration (CI)

Every developer's commit is merged into a shared trunk and verified by
automated builds and tests. The goal is to detect integration errors as
soon as possible.

**Key practices:**

- Small, frequent commits
- Automated build and test on every push
- Pull request checks before merge
- Fast feedback (target < 10 minutes)

### Continuous Delivery (CD)

All changes that pass CI are automatically prepared for release to production.
A human approval step gates the final deployment.

### Continuous Deployment

One step further — every change that passes the pipeline is deployed directly
to production with no manual intervention.

---

## GitHub Actions Concepts

### Workflow

A YAML file in `.github/workflows/` that defines automation triggered by
events, scheduled intervals, or manual dispatch.

```yaml
name: CI Pipeline
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
```

### Job

A workflow contains one or more jobs. Each job runs independently (in parallel
by default) on its own runner.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello, CI!"
```

### Step

Each job contains steps — individual tasks executed sequentially.

- `uses:` runs a pre-built action (from Marketplace or local)
- `run:` runs a shell command

### Runner

The VM where jobs execute. GitHub-hosted runners include ubuntu-latest,
windows-latest and macos-latest.

### Secret

Encrypted variables for tokens, passwords and keys. Never hardcode secrets
in YAML; always use `${{ secrets.NAME }}`.

---

## Common Trigger Events

| Event | Description |
|-------|-------------|
| `push` | Triggered when code is pushed to a branch |
| `pull_request` | Triggered when a PR is opened, updated or merged |
| `schedule` | Runs on a cron schedule (e.g. daily at 2 AM) |
| `workflow_dispatch` | Manual trigger via the GitHub UI |
| `release` | Triggered when a release is published |

---

## Useful Built-in Actions

| Action | Purpose |
|--------|---------|
| `actions/checkout@v4` | Clone the repository |
| `actions/setup-node@v4` | Install a specific Node.js version |
| `actions/cache@v4` | Cache dependencies between runs |
| `docker/build-push-action@v6` | Build and push Docker images |
| `docker/login-action@v3` | Authenticate to a container registry |

---

## Best Practices

1. **Pin action versions to major tags** (e.g. `actions/checkout@v4`).
2. **Cache dependencies** to reduce build time.
3. **Fail fast** — run quick jobs (lint) before slow jobs (integration tests).
4. **Separate CI and CD** into different workflow files for clarity.
5. **Use matrix builds** to test across multiple OS/runtime versions.
6. **Store secrets in GitHub Settings** — never commit them.
7. **Re-run failed jobs** instead of pushing empty commits to retrigger.

---

## Example Workflow Files

See the sibling files in this repository:

- `.github/workflows/ci.yml` — CI pipeline (lint, test, security scan)
- `.github/workflows/deploy.yml` — CD pipeline (build image, deploy on tag)

---

## References

- [GitHub Actions documentation](https://docs.github.com/en/actions)
- [GitHub Actions Marketplace](https://github.com/marketplace?type=actions)
- [Awesome GitHub Actions](https://github.com/sdras/awesome-actions)
