# Git, GitHub & VS Code — Complete Workflow Guide

## 1. Introduction

Git, GitHub, and Visual Studio Code (VS Code) are commonly used together for software development and version control.

* **VS Code** → Used to write and manage code.
* **Git** → Used for version control and tracking changes locally.
* **GitHub** → Used to store Git repositories online and collaborate with others.

### Basic Workflow

```text
VS Code
   ↓
Write / Modify Code
   ↓
Git
   ↓
Commit Changes
   ↓
GitHub
```

---

## 2. Installing Git

After installing Git, verify the installation using:

```bash
git --version
```

Configure the Git username and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

These details are associated with the commits created by the user.

---

## 3. Creating a Git Repository

Open the project folder in VS Code and open the terminal.

Initialize Git:

```bash
git init
```

This creates a `.git` directory inside the project and enables Git version control for that project.

---

## 4. Checking Project Status

To see which files have been modified, added, or are not being tracked:

```bash
git status
```

Example:

```text
Untracked files:
    index.html
    style.css
    script.js
```

---

## 5. Staging Changes

To stage all changes:

```bash
git add .
```

The `.` means all changes in the current project directory are added to the staging area.

Specific files can also be staged:

```bash
git add index.html
```

---

## 6. Creating a Commit

After staging the files, create a commit:

```bash
git commit -m "Initial project setup"
```

A **commit** is a snapshot of the project at a particular point in time.

Example:

```text
Code Changes
     ↓
git add
     ↓
Staging Area
     ↓
git commit
     ↓
Saved Version
```

---

## 7. Creating a Repository on GitHub

1. Log in to GitHub.
2. Click **New Repository**.
3. Enter the repository name.
4. Select the required visibility.
5. Create the repository.

GitHub provides a repository where the local Git project can be uploaded.

---

## 8. Connecting Local Git to GitHub

Add the GitHub repository as a remote:

```bash
git remote add origin YOUR_REPOSITORY_URL
```

Check the remote connection:

```bash
git remote -v
```

The remote repository is commonly named:

```text
origin
```

---

## 9. Pushing Code to GitHub

For the first push:

```bash
git branch -M main
git push -u origin main
```

After the first push, normally:

```bash
git push
```

### Push Workflow

```text
VS Code
   ↓
Git
   ↓
Commit
   ↓
git push
   ↓
GitHub
```

---

## 10. Pulling Changes from GitHub

If changes have been made to the GitHub repository, download them to the local computer using:

```bash
git pull
```

### Pull Workflow

```text
GitHub
   ↓
git pull
   ↓
Local Git Repository
   ↓
VS Code
```

---

## 11. Cloning an Existing Repository

If a project already exists on GitHub and needs to be downloaded to a computer:

```bash
git clone YOUR_REPOSITORY_URL
```

Then open the cloned project in VS Code.

Example:

```text
GitHub Repository
       ↓
   git clone
       ↓
Local Computer
       ↓
     VS Code
```

---

## 12. Daily Git Workflow

A normal development cycle can be performed using the following commands:

```bash
git pull
```

Write or modify code in VS Code.

Check the changes:

```bash
git status
```

Stage the changes:

```bash
git add .
```

Create a commit:

```bash
git commit -m "Describe the changes"
```

Upload the changes:

```bash
git push
```

### Complete Workflow

```text
        Start
          ↓
      git pull
          ↓
     Write Code
          ↓
     git status
          ↓
       git add .
          ↓
   git commit -m "message"
          ↓
       git push
          ↓
       GitHub
```

---

## 13. Using Git Through VS Code

VS Code provides a built-in **Source Control** panel.

It can be used to:

* View changed files
* Stage files
* Unstage files
* Create commits
* Push changes
* Pull changes
* View differences between versions

The basic process is:

```text
Source Control
      ↓
Review Changes
      ↓
Stage Changes
      ↓
Enter Commit Message
      ↓
Commit
      ↓
Push / Sync
```

Although VS Code provides a graphical interface, understanding Git commands is useful for working with Git from any environment.

---

## 14. Git Branches

Branches allow developers to work on different features without directly modifying the main branch.

Create a new branch:

```bash
git switch -c login-feature
```

Switch between branches:

```bash
git switch main
```

View branches:

```bash
git branch
```

Example:

```text
main
  │
  └── login-feature
```

The feature can be developed separately and later merged into the main branch.

---

## 15. Pull Requests

A **Pull Request (PR)** is used to propose changes from one branch to another on GitHub.

Typical workflow:

```text
main
  ↓
Create Feature Branch
  ↓
Develop Feature
  ↓
Commit Changes
  ↓
Push Branch
  ↓
Create Pull Request
  ↓
Review
  ↓
Merge into main
```

Pull Requests are especially useful when working in teams.

---

## 16. .gitignore

Some files should not be uploaded to GitHub.

A `.gitignore` file tells Git which files or folders should not be tracked.

Example:

```text
node_modules/
.env
*.log
```

This is especially important for sensitive information such as passwords, API keys, and environment variables.

---

## 17. README.md

A `README.md` file provides information about the project.

A README can contain:

* Project title
* Project description
* Technologies used
* Features
* Installation instructions
* Usage instructions
* Project structure
* Contributors

Example:

```markdown
# Loan Management System

## Description

A web-based application for managing loan applications.

## Technologies Used

- HTML
- CSS
- JavaScript
- PHP
- MySQL

## Features

- User Registration
- User Login
- Loan Application
- Loan Status Tracking
```

---

## 18. Important Git Commands

| Command                   | Purpose                                      |
| ------------------------- | -------------------------------------------- |
| `git init`                | Initializes a Git repository                 |
| `git status`              | Shows the current repository status          |
| `git add .`               | Stages all changes                           |
| `git add <file>`          | Stages a specific file                       |
| `git commit -m "message"` | Creates a commit                             |
| `git log`                 | Displays commit history                      |
| `git push`                | Uploads local commits to GitHub              |
| `git pull`                | Downloads and integrates changes from GitHub |
| `git clone <URL>`         | Copies a GitHub repository locally           |
| `git branch`              | Lists branches                               |
| `git switch <branch>`     | Switches branches                            |
| `git switch -c <branch>`  | Creates and switches to a new branch         |
| `git remote -v`           | Shows connected remote repositories          |

---

## 19. Git vs GitHub vs VS Code

| Tool                  | Main Purpose                        |
| --------------------- | ----------------------------------- |
| **VS Code**           | Writing and editing source code     |
| **Git**               | Tracking and managing code versions |
| **GitHub**            | Hosting Git repositories online     |
| **GitHub Repository** | Online version of the project       |
| **Commit**            | Saved version/snapshot of changes   |
| **Branch**            | Separate line of development        |
| **Pull Request**      | Request to merge changes            |

---

## 20. Complete Project Workflow

The complete workflow for a typical project is:

```text
Create Project
      ↓
Open Project in VS Code
      ↓
git init
      ↓
Create / Modify Files
      ↓
git status
      ↓
git add .
      ↓
git commit -m "Initial commit"
      ↓
Create GitHub Repository
      ↓
Connect Local Repository
      ↓
git push
      ↓
GitHub
```

For future development:

```text
git pull
   ↓
Write / Modify Code
   ↓
git status
   ↓
git add .
   ↓
git commit -m "Describe changes"
   ↓
git push
   ↓
GitHub
```

---

## 21. Key Concept

The relationship between the three tools can be summarized as:

```text
                    GitHub
                 Online Repository
                       ↑
                     push
                       │
                     pull
                       │
                    Git
              Version Control
                       ↑
                       │
                    VS Code
               Code Development
```

**In simple terms:**

> VS Code is where the code is written, Git tracks the changes and versions of that code, and GitHub stores the Git repository online for backup, sharing, and collaboration.
