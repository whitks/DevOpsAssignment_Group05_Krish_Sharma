# Docker Basics — DevOps Notes

## What is Docker?

Docker is a platform for developing, shipping and running applications inside
lightweight, isolated environments called **containers**. Containers package
an application together with all its dependencies (libraries, runtime,
config) so it runs the same way on any machine.

### Container vs Virtual Machine

| Feature | Container | Virtual Machine |
|---------|-----------|-----------------|
| Isolation | Process-level | Hardware-level |
| OS | Shares host kernel | Own full OS |
| Boot time | Milliseconds | Seconds–minutes |
| Size | MB | GB |
| Density | High | Low |

### Image vs Container

- **Image** – a read-only template (the recipe) used to create containers.
- **Container** – a running, writable instance of an image.

---

## Core Concepts

| Concept | Description |
|---------|-------------|
| Dockerfile | Text file with instructions to build an image |
| Image | Immutable snapshot built from a Dockerfile |
| Container | Running instance of an image |
| Registry | Storage for images (Docker Hub, GHCR) |
| Volume | Persistent data storage attached to a container |
| Network | Connects containers together (bridge, host, overlay) |
| Compose | Declarative multi-container setup in YAML |

---

## Essential Commands

```bash
# Images
docker build -t my-app .
docker pull nginx:alpine
docker images
docker rmi my-app

# Containers
docker run -d -p 8080:80 --name web nginx:alpine
docker ps
docker ps -a
docker logs web
docker exec -it web sh
docker stop web && docker rm web
docker rm -f web

# Cleanup
docker system prune -a
docker volume ls
docker network ls

# Compose
docker compose up -d
docker compose down
docker compose logs -f
```

---

## Anatomy of a Dockerfile

```dockerfile
# Base image with a runtime and version
FROM node:20-alpine

# Working directory inside the container
WORKDIR /app

# Copy dependency files first (better layer caching)
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the source
COPY . .

# Document the exposed port
EXPOSE 3000

# Default command when the container starts
CMD ["node", "server.js"]
```

### Dockerfile best practices

1. Use a **specific base image** tag, never `latest` blindly.
2. Order instructions by **change frequency** (dependencies first).
3. Prefer **multi-stage builds** to keep final images small.
4. Run processes as a **non-root user**.
5. Add a **HEALTHCHECK** so orchestrators can detect failures.
6. Use `.dockerignore` to keep the build context small.

---

## Docker Compose

`docker-compose.yml` declares multi-container applications. Useful for a
stack such as app + database + monitoring.

```yaml
version: "3.8"
services:
  app:
    build: .
    ports:
      - "8080:3000"
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: devops
      POSTGRES_PASSWORD: secret
```

```bash
docker compose up -d
docker compose ps
docker compose down
```

---

## Volumes and Networks

```bash
# Named volume — survives container recreation
docker volume create pgdata
docker run -v pgdata:/var/lib/postgresql/data postgres:16-alpine

# Custom bridge network
docker network create devops-net
docker run --network devops-net --name db postgres:16-alpine
docker run --network devops-net --name api my-app   # api can resolve "db"
```

---

## Security Highlights

- Never store secrets in the image — use environment variables or secrets.
- Drop unnecessary capabilities and run as `USER node` instead of root.
- Scan images with `docker scan` or Trivy before pushing.
- Keep base images patched and up to date.

---

## References

- [Docker Documentation](https://docs.docker.com)
- [Docker Hub](https://hub.docker.com)
- [Compose file reference](https://docs.docker.com/compose/compose-file/)