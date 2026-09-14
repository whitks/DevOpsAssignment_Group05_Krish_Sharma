# DevOps Best Practices

A practical checklist distilled from the experience of high-performing
engineering teams (see the DORA state of DevOps research).

## Version Control

- Commit **small, focused, reviewable** changes.
- Use **conventional commit messages** (`feat:`, `fix:`, `docs:`, `ci:`).
- Gate all changes to `main` behind **pull requests** with required checks.
- Never commit secrets — use secret managers and pre-commit hooks.

## CI/CD

- Run CI on every push and every pull request.
- Keep pipelines **fast** (< 10 minutes for the common path).
- **Cache** dependencies, pin action/plugin versions.
- **Fail fast**: lint before build, build before slow integration tests.
- Separate **CI** (verify) from **CD** (release) responsibilities.
- Define rollback strategy for every deployment.

## Containers & Orchestration

- Use **small, multi-stage images**; prefer scratch/alpine where possible.
- Tag images with the **commit SHA**, never only `latest`.
- Run containers as **non-root** users and scan images for CVEs.
- Declare **resource limits** and **probes** in Kubernetes manifests.

## Infrastructure as Code

- Keep IaC in the same review workflow as application code.
- Use **remote state with locking** (S3 + DynamoDB, Terraform Cloud).
- `terraform plan` in CI and review the diff — `apply` only by maintainers.
- **Destroy** unused environments; never reuse production state for dev.

## Monitoring & Alerting

- Alert on **user-visible symptoms** and SLO burn, not raw CPU.
- Keep dashboards **actionable** — every graph should have an owner.
- Set alert routing by severity and keep a **playbook** per alert.
- Review alert noise regularly (alert fatigue destroys trust).

## Security (DevSecOps)

- **Shift left**: SAST/DAST early, dependency scanning in CI.
- Apply **least privilege** to IAM roles and service accounts.
- Rotate credentials and avoid long-lived keys.
- Harden base images and keep bases patched.

## Culture

- **Blameless post-mortems**: focus on systems, not people.
- Use feature flags for safe, progressive rollouts.
- Automate repeated work, document decisions (ADRs).
- Continuously measure: **lead time, deployment frequency, MTTR, change-failure rate**.

---

## Measuring Success (DORA Metrics)

| Metric | Target |
|--------|--------|
| Deployment frequency | On-demand (multiple deploys/day) |
| Lead time for changes | Less than a day |
| Change failure rate | 0–15% |
| Time to restore service | Less than one day |