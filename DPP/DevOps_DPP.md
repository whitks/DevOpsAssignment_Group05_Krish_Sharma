# Daily Practice Problems – DevOps Fundamentals

## DPP 01 – Git Basics

1. What is the difference between `git merge` and `git rebase`?
2. How do you undo the last commit without losing changes?
3. Write the commands to create a new branch, switch to it, and push it to remote.
4. What is a merge conflict and how do you resolve it?
5. Explain the difference between `git stash` and `git commit`.

## DPP 02 – CI/CD Concepts

1. What is Continuous Integration?
2. What is Continuous Delivery vs Continuous Deployment?
3. Name two CI/CD tools and their key features.
4. Write a basic GitHub Actions workflow YAML that runs on push to main.
5. What is a build pipeline?

## DPP 03 – Docker

1. What is the difference between an image and a container?
2. Write a Dockerfile for a simple Node.js application.
3. What commands are used to build and run a Docker container?
4. What is Docker Compose and when would you use it?
5. Explain the purpose of `.dockerignore`.

## DPP 04 – Linux & Scripting

1. Write a bash script that checks if a directory exists and creates it if not.
2. What is the difference between `chmod 755` and `chmod 644`?
3. How do you schedule a cron job to run a script every day at 9 AM?
4. What does `grep -r "error" /var/log` do?
5. Explain the purpose of `#!/bin/bash` in a script.

## DPP 05 – DevOps Lifecycle

1. List the 8 stages of the DevOps lifecycle.
2. What is Infrastructure as Code (IaC)?
3. Name two IaC tools.
4. What is monitoring and why is it important in DevOps?
5. Explain the concept of shift-left testing.

## Solutions

### DPP 01 Solutions

1. `git merge` creates a merge commit combining branches. `git rebase` replays commits on top of another branch for a linear history.
2. `git reset --soft HEAD~1`
3.
```bash
git checkout -b new-branch
git push -u origin new-branch
```
4. A merge conflict occurs when Git cannot automatically merge changes. Resolve by editing the conflicted files, choosing the correct version, then `git add` and `git commit`.
5. `git stash` temporarily saves uncommitted changes. `git commit` permanently saves changes to the repository history.

### DPP 02 Solutions

1. CI is the practice of automatically integrating code changes from multiple contributors into a shared repository, verified by automated builds and tests.
2. Continuous Delivery automatically prepares code for release but requires manual approval. Continuous Deployment automatically deploys every change to production.
3. Jenkins (flexible, plugin-based) and GitHub Actions (native GitHub integration, YAML-based).
```yaml
name: CI Pipeline
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Building..."
```
5. A series of steps that automatically build, test, and prepare code for release.

### DPP 03 Solutions

1. An image is a read-only template with instructions for creating a container. A container is a runnable instance of an image.
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```
3. `docker build -t my-app .` and `docker run -p 3000:3000 my-app`
4. Docker Compose is a tool for defining and running multi-container Docker applications using a YAML file.
5. `.dockerignore` excludes files from the Docker build context to keep the image small.

### DPP 04 Solutions

1.
```bash
#!/bin/bash
if [ ! -d "mydir" ]; then
  mkdir mydir
  echo "Directory created"
else
  echo "Directory already exists"
fi
```
2. `755` = owner rwx, group rx, others rx. `644` = owner rw, group r, others r.
3. `0 9 * * * /path/to/script.sh`
4. Recursively searches `/var/log` for lines containing "error".
5. `#!/bin/bash` is a shebang line that tells the system to use the Bash interpreter.

### DPP 05 Solutions

1. Plan, Code, Build, Test, Release, Deploy, Operate, Monitor.
2. IaC is managing infrastructure through machine-readable configuration files rather than manual processes.
3. Terraform and Ansible.
4. Monitoring tracks system performance, availability, and health to detect issues early and ensure reliability.
5. Shift-left testing means performing testing earlier in the development lifecycle to catch bugs sooner and reduce cost.
