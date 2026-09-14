# DevOps Glossary — A–Z

Terms DevOps engineers use every day.

## A

| Term | Meaning |
|------|---------|
| **Agile** | Iterative software delivery framework with short feedback loops |
| **Artifact** | Build output stored for deployment (jar, image, tarball) |
| **Automation** | Replacing manual tasks with scripted, repeatable processes |

## B

| Term | Meaning |
|------|---------|
| **Blue/Green Deployment** | Two identical environments; switch traffic atomically |
| **Build** | Compilation/assembly step that produces a deployable artifact |
| **Branching** | Isolated lines of development inside version control |

## C

| Term | Meaning |
|------|---------|
| **CI (Continuous Integration)** | Frequent merging + automated verification |
| **CD (Continuous Delivery/Deployment)** | Auto-release prepared or shipped code |
| **Container** | Isolated, lightweight runtime unit for apps + deps |
| **Canary Release** | Slowly rolling out a change to a small subset of users |
| **Cron** | Time-based scheduler on Unix/Linux |
| **Context** | The set of files sent to a Docker build |

## D

| Term | Meaning |
|------|---------|
| **DaemonSet** | K8s object running a pod on every node |
| **Deployment** | K8s controller managing declarative rolling updates |
| **Dockerfile** | Instructions to build a container image |
| **Drift** | Difference between declared and actual infrastructure |

## E

| Term | Meaning |
|------|---------|
| **Elasticsearch** | Full-text search / log storage engine |
| **eBPF** | Kernel tech enabling deep observability |
| **Environment** | A deployment target (dev, staging, production) |

## F

| Term | Meaning |
|------|---------|
| **Feature Flag** | Runtime toggle to enable/disable functionality |
| **Fluentd/Fluent Bit** | Log collectors and forwarders |

## G

| Term | Meaning |
|------|---------|
| **Golden Signal** | Latency, traffic, errors, saturation |
| **Grafana** | Visualization/dashboard tool for metrics |
| **Git** | Distributed version control system |

## H

| Term | Meaning |
|------|---------|
| **Headless Service** | K8s service for direct pod access (no load balancing) |
| **Helm** | Kubernetes package manager (charts) |
| **Hotfix** | Urgent fix applied directly to a stable branch |

## I

| Term | Meaning |
|------|---------|
| **IaC (Infrastructure as Code)** | Infrastructure defined as versioned files |
| **Idempotency** | Running an operation twice yields the same state |
| **Ingress** | K8s object exposing services externally via rules |
| **Image** | Immutable, packaged application template |

## J

| Term | Meaning |
|------|---------|
| **Jira** | Issue tracking tool often paired with Agile/DevOps |
| **Job** | A unit of work; also a GitHub Actions / K8s object |

## K

| Term | Meaning |
|------|---------|
| **Kubernetes (K8s)** | Container orchestration platform |
| **Kubeconfig** | Config file with cluster + credential info |

## L

| Term | Meaning |
|------|---------|
| **Latency** | Time taken to complete a request |
| **Liveness Probe** | K8s check that restarts an unhealthy container |
| **Loki** | Grafana's log aggregation store |
| **Lead Time** | Time from commit to production |

## M

| Term | Meaning |
|------|---------|
| **MTTR** | Mean Time To Restore/Repair |
| **Metrics** | Numeric measurements used for alerting and dashboards |
| **Multi-stage Build** | Docker build using intermediate stages for smaller images |

## N

| Term | Meaning |
|------|---------|
| **Namespace** | K8s logical isolation boundary |
| **Node** | A worker machine in a Kubernetes cluster |
| **Nightly** | Scheduled job/build run outside of office hours |

## O

| Term | Meaning |
|------|---------|
| **Observability** | Inferring system behavior from outputs (metrics, logs, traces) |
| **Orchestration** | Automating deployment, scaling and management of containers |

## P

| Term | Meaning |
|------|---------|
| **Pipeline** | Ordered automation stages (build → test → deploy) |
| **Pod** | Smallest deployable unit of work in Kubernetes |
| **Prometheus** | Pull-based metrics collection and alerting system |
| **Pull Request (PR)** | Proposed change awaiting review and merge |

## Q

| Term | Meaning |
|------|---------|
| **Quality Gates** | Checks (tests, coverage, vulns) that block releases |

## R

| Term | Meaning |
|------|---------|
| **Rollback** | Reverting to the previous known-good release |
| **Rolling Update** | Progressive replacement of pods with zero downtime |
| **Readiness Probe** | K8s check for whether a pod receives traffic |

## S

| Term | Meaning |
|------|---------|
| **SLO / SLI / SLA** | Service Level Objective / Indicator / Agreement |
| **SAST / DAST** | Static / Dynamic Application Security Testing |
| **Secret** | Sensitive value injected at runtime, not stored in code |
| **Sidecar** | Helper container alongside the main app container |
| **Shift-Left** | Moving checks earlier in the software lifecycle |

## T

| Term | Meaning |
|------|---------|
| **Terraform** | Declarative IaC tool by HashiCorp |
| **Trunk-Based Development** | Short-lived branches merged often to a shared trunk |
| **Tolerations / Taints** | K8s scheduling constraints for nodes |

## U

| Term | Meaning |
|------|---------|
| **UAT** | User Acceptance Testing |
| **Uptime** | Percentage of time a service was available |

## V

| Term | Meaning |
|------|---------|
| **Version Control** | Tracking changes to files over time (Git) |
| **Volume** | Persistent storage mounted into containers |

## W

| Term | Meaning |
|------|---------|
| **Webhook** | HTTP callback triggered by an event |
| **Workload** | An app running on a cluster (Deployment, StatefulSet, Job) |

## X

| Term | Meaning |
|------|---------|
| **XOps (DevOps, GitOps, SecOps...)** | Applying DevOps culture to other domains |

## Y

| Term | Meaning |
|------|---------|
| **YAML** | Human-readable data format used by K8s, Compose, CI files |

## Z

| Term | Meaning |
|------|---------|
| **Zero-Downtime Deployment** | Releasing changes without interrupting service |