# Assignment – DevOps Practical Tasks

## Assignment 01: Git Workflow

### Objective
Demonstrate understanding of Git branching and collaboration.

### Tasks
1. Create a repository on GitHub.
2. Clone the repository locally.
3. Create a feature branch.
4. Add a file with your name and roll number.
5. Commit and push the feature branch.
6. Create a Pull Request to main.
7. Merge the Pull Request.
8. Pull the changes to your local main branch.

### Deliverable
Screenshot of the merged Pull Request and local `git log`.

---

## Assignment 02: CI/CD Pipeline

### Objective
Create a basic CI pipeline using GitHub Actions.

### Tasks
1. Create a `.github/workflows/ci.yml` file.
2. The workflow should:
   - Trigger on push to main.
   - Check out the code.
   - Run a linting step (any language).
   - Run a test step.
   - Print a success message.
3. Push the workflow file.
4. Verify the pipeline runs successfully.

### Deliverable
Working GitHub Actions workflow with passing status.

---

## Assignment 03: Docker Application

### Objective
Containerize a simple web application.

### Tasks
1. Create a simple HTML/CSS/JS website.
2. Write a Dockerfile for the application.
3. Build the Docker image.
4. Run the container and verify the website works.
5. Push the image to Docker Hub.

### Commands Reference
```bash
docker build -t my-web-app .
docker run -d -p 8080:80 my-web-app
docker tag my-web-app username/my-web-app:latest
docker push username/my-web-app:latest
```

### Deliverable
Docker Hub image URL and running container screenshot.

---

## Assignment 04: Linux Scripting

### Objective
Write bash scripts for common DevOps tasks.

### Tasks
1. Write a script that displays system information (OS, CPU, memory, disk).
2. Write a script that backs up a directory with a timestamp.
3. Write a script that monitors disk usage and alerts if usage exceeds 80%.
4. Schedule one of the scripts using cron.

### Deliverable
Scripts with comments explaining each step.
