# DevOps Learning Path

A step-by-step, level-ordered plan to learn DevOps from zero to working
pipelines. Each level maps to folders in this repository.

## Level 0 — Foundations

- [x] Git basics, branching and Pull Requests → `CheatSheet/`, `Assignments/`
- Tools: `git`, GitHub

## Level 1 — Automation fundamentals

- Linux command line → [`linux/Linux_DevOps_Commands.md`](linux/Linux_DevOps_Commands.md)
- Bash scripting → [`scripts/`](scripts/README.md)

## Level 2 — Continuous Integration

- CI/CD concepts → [`ci-cd/GitHub_Actions_Guide.md`](ci-cd/GitHub_Actions_Guide.md)
- Sample workflows → `.github/workflows/ci.yml`, `.github/workflows/deploy.yml`

## Level 3 — Containers

- Docker basics → [`docker/Docker_Basics.md`](docker/Docker_Basics.md)
- Example `Dockerfile`, `.dockerignore`, `docker-compose.yml` → [`docker/`](docker/)

## Level 4 — Orchestration

- Kubernetes essentials → [`kubernetes/Kubernetes_Basics.md`](kubernetes/Kubernetes_Basics.md)
- Manifests (`deployment.yaml`, `service.yaml`, `ingress.yaml`) → [`kubernetes/`](kubernetes/)

## Level 5 — Infrastructure as Code

- Terraform notes → [`iac/Terraform_Notes.md`](iac/Terraform_Notes.md)
- HCL code → [`iac/terraform/`](iac/terraform/)

## Level 6 — Observability

- Monitoring notes → [`monitoring/Monitoring_Notes.md`](monitoring/Monitoring_Notes.md)
- Prometheus + alert config → [`monitoring/`](monitoring/)

## Level 7 — Cloud & Serverless

- AWS notes → [`cloud/AWS_DevOps_Notes.md`](cloud/AWS_DevOps_Notes.md)
- Lambda sample → [`cloud/hello_lambda.py`](cloud/hello_lambda.py)

## Level 8 — Security & Culture

- DevSecOps → [`security/DevSecOps_Basics.md`](security/DevSecOps_Basics.md)
- Best practices → [`best-practices/Best_Practices.md`](best-practices/Best_Practices.md)

---

## Suggested Hands-on Project

Build a complete shop pipeline:

1. Start a Node/Python app and put it under GitHub.
2. Add a `ci.yml` that runs lint + tests on every PR.
3. Containerize it with a multistage `Dockerfile`.
4. Push the image to GHCR on a `v*` tag.
5. Deploy to a free cluster (Kind/minikube locally) with manifests.
6. Provision the VM/cluster with Terraform.
7. Scrape its `/metrics` with Prometheus and visualise in Grafana.
8. Add alert rules and a rollback playbook.