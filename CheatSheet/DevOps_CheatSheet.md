# DevOps Cheat Sheet

## Git Commands

| Command | Description |
|---------|-------------|
| `git init` | Initialize a new repository |
| `git clone <url>` | Clone a remote repository |
| `git add .` | Stage all changes |
| `git commit -m "msg"` | Commit staged changes |
| `git push` | Push to remote |
| `git pull` | Pull from remote |
| `git branch <name>` | Create a new branch |
| `git checkout <branch>` | Switch to a branch |
| `git merge <branch>` | Merge a branch |
| `git log --oneline` | View commit history |
| `git stash` | Save uncommitted changes |
| `git stash pop` | Restore stashed changes |
| `git reset --soft HEAD~1` | Undo last commit (keep changes) |
| `git diff` | View unstaged changes |
| `git remote -v` | View remote URLs |

## Docker Commands

| Command | Description |
|---------|-------------|
| `docker build -t <name> .` | Build an image from Dockerfile |
| `docker run -d -p 8080:80 <image>` | Run a container |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker images` | List all images |
| `docker stop <container>` | Stop a running container |
| `docker rm <container>` | Remove a container |
| `docker rmi <image>` | Remove an image |
| `docker logs <container>` | View container logs |
| `docker exec -it <container> bash` | Open shell in container |
| `docker-compose up -d` | Start services in background |
| `docker-compose down` | Stop and remove services |
| `docker push <image>` | Push image to registry |
| `docker pull <image>` | Pull image from registry |
| `docker network ls` | List networks |

## Kubernetes Commands

| Command | Description |
|---------|-------------|
| `kubectl get nodes` | List cluster nodes |
| `kubectl get pods` | List pods |
| `kubectl get services` | List services |
| `kubectl get deployments` | List deployments |
| `kubectl describe pod <name>` | Pod details |
| `kubectl logs <pod>` | View pod logs |
| `kubectl apply -f <file>` | Apply a manifest |
| `kubectl delete -f <file>` | Delete resources from manifest |
| `kubectl scale deployment <name> --replicas=N` | Scale deployment |
| `kubectl rollout status deployment <name>` | Check rollout status |
| `kubectl rollout undo deployment <name>` | Rollback deployment |
| `kubectl exec -it <pod> -- bash` | Shell into pod |
| `minikube start` | Start local cluster |
| `minikube stop` | Stop local cluster |

## Linux Commands

| Command | Description |
|---------|-------------|
| `ls -la` | List all files with details |
| `cd <dir>` | Change directory |
| `pwd` | Print working directory |
| `mkdir <dir>` | Create directory |
| `rm -rf <dir>` | Force remove directory |
| `cp -r <src> <dest>` | Copy recursively |
| `mv <src> <dest>` | Move or rename |
| `chmod 755 <file>` | Set permissions |
| `chown user:group <file>` | Change ownership |
| `cat <file>` | Display file contents |
| `grep -r "text" <dir>` | Search recursively |
| `find / -name "*.log"` | Find files by name |
| `ps aux` | List running processes |
| `top` | Process monitor |
| `df -h` | Disk usage |
| `free -m` | Memory usage |
| `curl <url>` | HTTP request |
| `wget <url>` | Download file |
| `ssh user@host` | Remote login |
| `scp file user@host:path` | Copy file over SSH |
| `crontab -e` | Edit cron jobs |
| `systemctl status <service>` | Check service status |
| `systemctl start <service>` | Start a service |
| `systemctl stop <service>` | Stop a service |

## CI/CD – GitHub Actions

```yaml
name: CI Pipeline
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm install
      - run: npm test
      - name: Build
        run: npm run build
```

## Dockerfile Template

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

## docker-compose.yml Template

```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - db
  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - db-data:/var/lib/postgresql/data
volumes:
  db-data:
```

## Kubernetes Deployment YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-app
          image: nginx:latest
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 80
  type: NodePort
```

## DevOps Lifecycle

```
Plan → Code → Build → Test → Release → Deploy → Operate → Monitor
```

## Common Ports

| Port | Service |
|------|---------|
| 22 | SSH |
| 80 | HTTP |
| 443 | HTTPS |
| 3000 | Node.js / React |
| 5000 | Flask / Python |
| 8080 | Tomcat / Alt HTTP |
| 8443 | Alt HTTPS |
| 3306 | MySQL |
| 5432 | PostgreSQL |
| 6379 | Redis |
| 27017 | MongoDB |
| 9090 | Prometheus |
| 3000 | Grafana |

## Environment Variables

```bash
# Set
export NAME=value

# Permanent (add to ~/.bashrc)
echo 'export NAME=value' >> ~/.bashrc
source ~/.bashrc

# View
echo $NAME
env
```

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Port already in use | `lsof -i :PORT` then kill process |
| Permission denied | `chmod +x script.sh` |
| Docker not starting | `sudo systemctl start docker` |
| kubectl connection refused | Check cluster: `kubectl cluster-info` |
| Merge conflict | Edit files, `git add`, `git commit` |
| Container keeps restarting | Check logs: `docker logs <container>` |
