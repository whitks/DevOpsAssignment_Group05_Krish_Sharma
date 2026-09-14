# AWS Services for DevOps — Notes

## Why Cloud + DevOps?

AWS (Amazon Web Services) provides the on-demand infrastructure that makes
modern DevOps pipelines possible. Instead of owning hardware, teams spin
up resources via APIs and IaC, and tear them down the moment they are no
longer needed.

---

## Core AWS Services for DevOps

| Service | Role in DevOps |
|---------|----------------|
| **EC2** | Virtual machines for building, testing and hosting |
| **ECS / EKS** | Run containers without managing VMs (Docker / Kubernetes) |
| **S3** | Object storage — artifacts, logs, static websites |
| **RDS** | Managed relational database |
| **Lambda** | Serverless functions for hooks, data processing, micro-tasks |
| **CodeCommit** | Managed Git (alternative to GitHub) |
| **CodeBuild** | Managed build + test (pipelines) |
| **CodeDeploy** | Automate deployments to EC2, ECS or Lambda |
| **CodePipeline** | Orchestrate the full CI/CD pipeline |
| **CloudWatch** | Metrics, logs, alarms and dashboards |
| **CloudFormation** | IaC — AWS's own YAML template language |
| **IAM** | Identity & Access — roles, policies, least-privilege |

---

## Sample AWS CI/CD Pipeline (Conceptual)

```
Source (GitHub/CodeCommit)
       ↓
Build (CodeBuild — npm ci, npm test, docker build)
       ↓
Artifact (S3 — docker image, build tarball)
       ↓
Deploy (CodeDeploy → ECS or EC2)
       ↓
Monitor (CloudWatch)
```

---

## IAM Best Practices

1. Follow **least privilege** — give each role only the permissions it needs.
2. Never use the root account for programmatic access.
3. Use **IAM roles** over long-lived access keys.
4. Enforce **MFA** on human accounts.
5. Audit regularly with **IAM Access Analyzer**.

---

## Lambda Quick Start

See `hello_lambda.py` and `hello_lambda_event.json` in this folder for a
simple Python 3.12 Lambda function and a test event.

```bash
# local test (via AWS SAM CLI)
sam local invoke HelloWorldFunction -e hello_lambda_event.json

# deploy with SAM
sam build
sam deploy --guided
```

---

## CloudWatch for DevOps

- **Alarms** — notify on thresholds (CPU, error rate, latency).
- **Dashboards** — build single-pane-of-glass views of your system.
- **Log Insights** — query log streams with SQL-like syntax.
- **Synthetics** — run canaries that hit your endpoints 24/7.

---

## AWS vs Azure vs GCP

| Aspect | AWS | Azure | GCP |
|--------|-----|-------|-----|
| IaC | CloudFormation / Terraform | ARM / Bicep / Terraform | Deployment Manager / Terraform |
| Container | ECS, EKS | AKS | GKE |
| Serverless | Lambda | Functions | Cloud Functions |
| CI/CD | CodePipeline | Azure DevOps Pipelines | Cloud Build |
| IAM | IAM | Entra ID (AAD) | IAM |
| DB | RDS, DynamoDB | Cosmos DB, SQL DB | Cloud SQL, Firestore |

Most DevOps teams use **Terraform** across providers for portability.

---

## References

- [AWS Documentation](https://docs.aws.amazon.com)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [AWS Serverless Application Model (SAM)](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html)