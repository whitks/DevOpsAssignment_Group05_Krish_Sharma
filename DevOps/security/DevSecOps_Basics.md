# DevSecOps Basics — Security in the Pipeline

DevSecOps means baking security into every stage of the DevOps lifecycle
instead of bolting it on at the end ("shift-left").

## Pipeline Security Gates

| Stage | Security control |
|-------|------------------|
| IDE / commit | Pre-commit hooks, secret scanners (`gitleaks`, `trufflehog`) |
| Build | Dependency scan (`npm audit`, `trivy fs`) |
| Test | SAST (`Semgrep`, `CodeQL`), unit/integration tests |
| Image | Container scan (`trivy image`, `docker scan`) |
| Deploy | DAST, infra policy checks (`checkov`, `tfsec`) |
| Run | Runtime monitoring, WAF, CSP, egress control |

## Common Vulnerability Categories (OWASP Top 10)

1. Broken Access Control
2. Cryptographic Failures
3. Injection (SQL, command, LDAP)
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable & Outdated Components
7. Identification & Authentication Failures
8. Software & Data Integrity Failures
9. Security Logging & Monitoring Failures
10. Server-Side Request Forgery (SSRF)

## Secret Management

- Never commit secrets; use environment variables or a secret manager
  (AWS Secrets Manager, HashiCorp Vault, GitHub Actions secrets).
- Rotate keys periodically; use short-lived credentials.
- Revoke leaked credentials immediately and audit their usage.

## Secure By Design Playbook

- **Least privilege** for every role, service account and pipeline job.
- **Input validation** everywhere; treat all input as untrusted.
- **Pin versions** of base images, packages, actions and provider plugins.
- **Immutable infrastructure** — rebuild, don't patch, where possible.
- **Encrypt** data in transit (TLS) and at rest (KMS/SSE).
- **Audit logs** for IAM changes, deploys and access patterns.

## Safer CI/CD Recipe

```yaml
# .github/workflows/ci.yml (security additions)
- name: Scan code secrets
  run: gitleaks detect --source . --no-banner

- name: Scan dependencies (npm)
  run: npm audit --audit-level=high

- name: Scan container image
  run: |
    docker build -t devops-app:${{ github.sha }} .
    trivy image --exit-code 1 --severity HIGH,CRITICAL devops-app:${{ github.sha }}

- name: Static analysis (Semgrep)
  run: semgrep scan --config auto --error
```

## References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Semgrep](https://semgrep.dev)
- [Trivy](https://trivy.dev)
- [Gitleaks](https://github.com/gitleaks/gitleaks)