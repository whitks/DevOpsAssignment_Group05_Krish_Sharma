# Kubernetes Essentials — DevOps Notes

## What is Kubernetes?

Kubernetes (K8s) is an open-source container orchestration platform that
automates the **deployment, scaling and management** of containerized
applications. It was originally developed by Google and is now maintained by
the Cloud Native Computing Foundation (CNCF).

---

## Why Orchestration?

Running containers manually with Docker works for a few instances, but at
scale you need automation for:

- Automatic placement and restart of failed containers
- Scaling up and down based on load
- Rolling updates with zero downtime
- Service discovery and load balancing
- Storage orchestration and configuration management
- Self-healing (restart, reschedule, kill unhealthy workloads)

---

## Core Architecture

### Control Plane (Master)

| Component | Role |
|-----------|------|
| kube-apiserver | Front door for all API calls |
| etcd | Distributed key-value store of cluster state |
| kube-scheduler | Decides which node runs a pod |
| kube-controller-manager | Runs controller loops (deployments, nodes) |

### Worker Nodes

| Component | Role |
|-----------|------|
| kubelet | Agent that manages containers on the node |
| kube-proxy | Maintains network rules and load balancing |
| container runtime | Runs containers (containerd, CRI-O) |

---

## Core Objects

| Object | Purpose |
|--------|---------|
| Pod | Smallest deployable unit — one or more containers |
| Deployment | Declarative rollout and scaling of Pods |
| ReplicaSet | Maintains a stable set of replica Pods |
| Service | Stable network endpoint in front of a set of Pods |
| Ingress | External HTTP(S) routing rules to Services |
| ConfigMap | Non-confidential configuration |
| Secret | Base64-encoded confidential values |
| Namespace | Logical isolation of resources |
| PersistentVolume | Cluster-wide storage pool |

---

## Workflow: Deploy an Application

```bash
# 1. Apply the deployment manifest
kubectl apply -f deployment.yaml

# 2. Expose the pods via a Service
kubectl apply -f service.yaml

# 3. Check status
kubectl get pods,svc -n production
kubectl rollout status deployment/devops-app -n production

# 4. Scale on demand
kubectl scale deployment devops-app --replicas=5 -n production

# 5. Rolling update (change the image tag)
kubectl set image deployment/devops-app app=ghcr.io/whitks/...:v2 -n production

# 6. Roll back a bad release
kubectl rollout undo deployment/devops-app -n production
```

---

## Essential Commands

```bash
kubectl get nodes
kubectl get pods -o wide
kubectl describe pod <pod>
kubectl logs <pod>
kubectl exec -it <pod> -- sh
kubectl port-forward svc/devops-app-service 8080:80
kubectl get events --sort-by=.lastTimestamp
kubectl apply -f manifest.yaml
kubectl delete -f manifest.yaml
```

---

## Important Patterns

### Liveness vs Readiness Probes

- **Liveness probe** — is the app healthy, or must it be restarted?
- **Readiness probe** — is the app ready to receive traffic?

### Rolling updates and rollbacks

Deployments default to `RollingUpdate`: a new replica set is created and old
pods are replaced progressively, so the service never drops below the ready
target. Rollbacks revert to the previous revision.

### Namespaces for isolation

Use separate namespaces for `dev`, `staging` and `production` to avoid
accidental cross-environment contention.

---

## Local Development: minikube / kind

```bash
# minikube
minikube start --cpus=4 --memory=8192
kubectl get nodes

# kind (Kubernetes in Docker)
kind create cluster --name devops-cluster
kubectl get nodes
```

---

## References

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Kubernetes By Example](https://kubernetesbyexample.com)