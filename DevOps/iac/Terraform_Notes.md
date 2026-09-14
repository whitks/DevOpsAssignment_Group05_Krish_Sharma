# Infrastructure as Code (IaC) — Terraform Notes

## What is Infrastructure as Code?

IaC manages infrastructure — servers, networks, databases, load balancers —
through **machine-readable definition files** instead of manual or
interactive configuration. The infrastructure definitions live in version
control and go through the same review and CI/CD process as application code.

### Why IaC?

- **Repeatability** — identical environments every time.
- **Versioning** — infrastructure history, `git blame`, rollback.
- **Code review** — changes are reviewed before apply.
- **Drift detection** — config vs. reality can be compared automatically.
- **Disaster recovery** — re-create environments from scratch.
- **Cost** — destroy idle environments with one command.

### Declarative vs Imperative

| Approach | Example | Style |
|----------|---------|-------|
| Declarative (desired state) | Terraform, CloudFormation | "There are 3 instances running" |
| Imperative (step by step) | Shell scripts, Ansible ad-hoc | "Create instance, then configure it" |

---

## Terraform Workflow

### Core commands

```bash
terraform init          # install providers and backend
terraform fmt           # format config files
terraform validate      # validate syntax and logic
terraform plan          # preview changes (read-only)
terraform apply         # apply changes (reversible via state)
terraform show          # inspect current state
terraform destroy       # remove all managed resources
```

### The Plan / Apply loop

1. `terraform init` reads the providers and remote state backend.
2. `terraform plan` computes the diff between the *desired state* (`.tf`
   files) and the *current state* (`terraform.tfstate`).
3. `terraform apply` executes only the required create / update / delete
   operations.
4. The state file is updated and stored (ideally in a remote backend).

### State management best practices

- Never commit `terraform.tfstate` — it may contain secrets.
- Use a **remote backend** (S3 + DynamoDB lock, Terraform Cloud, etc.).
- Enable **locking** so two engineers cannot apply simultaneously.
- Store state per environment (dev / staging / prod) in separate keys.

---

## Terraform + CI/CD

Terraform fits naturally into a CI pipeline:

```yaml
# Conceptual GitLab/GitHub pipeline stages
- validate   → terraform fmt -check && terraform validate
- plan       → terraform plan -out plan.tfplan
- review     → comment the plan diff on the MR/PR
- apply      → terraform apply plan.tfplan (limited to maintainers)
```

---

## Terraform vs Ansible

| Aspect | Terraform | Ansible |
|--------|-----------|---------|
| Primary job | Provision infrastructure | Configure already-provisioned hosts |
| Mode | Declarative (desired state) | Procedural (playbooks) |
| Agent | None (provider plugins) | Agentless over SSH |
| Language | HCL | YAML |
| State | Yes (terraform.tfstate) | No (stateless) |

Teams commonly use **both**: Terraform creates VMs/networks, then Ansible
installs and configures software on them.

---

## Files in this folder

- `terraform/main.tf` — VPC, subnets, security group and an EC2 instance.
- `terraform/variables.tf` — reusable, sensible-default inputs.
- `terraform/outputs.tf` — useful values such as the server's public IP.
- `terraform/backend.tf` — (uncommitted) remote state backend setup.

---

## References

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [Terraform Best Practices](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices)