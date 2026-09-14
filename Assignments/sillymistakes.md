# Common Git, GitHub & VS Code Mistakes

When working with Git, GitHub, and VS Code, beginners may face some common mistakes and issues. The following points help in identifying and solving them.

## 1. Forgetting `git add`

### Problem

A file is created or modified, but the user directly runs:

```bash
git commit -m "Updated file"
```

Git may show:

```text
nothing added to commit
```

### Solution

First stage the file:

```bash
git add filename.md
```

Then commit:

```bash
git commit -m "Updated file"
```

---

## 2. Using `git add .` Without Checking Changes

### Problem

The user runs:

```bash
git add .
```

without checking what has changed.

This can stage unwanted files as well.

### Solution

Check the changes first:

```bash
git status
```

If only a specific file needs to be committed:

```bash
git add filename.md
```

---

## 3. Forgetting to Push After Commit

### Problem

The user creates a commit and assumes the changes are already visible on GitHub.

### Explanation

A commit is created in the local Git repository. It does not automatically upload the commit to GitHub.

### Solution

Run:

```bash
git push
```

### Remember

```text
git commit → Local
git push   → GitHub
```

---

## 4. Working on the Wrong Branch

### Problem

The user thinks they are working on `main`, but they are actually on another branch such as:

```text
hitarth
```

### Solution

Check the current branch:

```bash
git branch
```

The current branch will have a `*` next to it.

Example:

```text
* hitarth
  main
```

---

## 5. Typing the Wrong File Path

### Problem

The file is inside a folder:

```text
Assignments/howtousegthub.md
```

but the user runs:

```bash
git add howtousegthub.md
```

Git cannot find the file because the path is incorrect.

### Solution

Use the correct path:

```bash
git add Assignments/howtousegthub.md
```

---

## 6. Typing the Wrong File Name

### Problem

The actual file is:

```text
howtousegithub.md
```

but the command uses:

```bash
git add howtousegthub.md
```

Even a small spelling mistake can cause an error.

### Solution

Use:

```bash
git status
```

and copy the exact file path shown by Git.

---

## 7. Forgetting to Save the File in VS Code

### Problem

The user edits a file but does not save it before checking the changes.

### Solution

Save the file using:

```text
Ctrl + S
```

Then run:

```bash
git status
```

---

## 8. Creating a Git Repository in the Wrong Folder

### Problem

The user runs:

```bash
git init
```

inside the wrong directory.

This can create a Git repository that does not contain the intended project.

### Solution

Check the current directory before running `git init`.

In VS Code, make sure the correct project folder is opened.

---

## 9. Forgetting to Initialize Git

### Problem

The user tries:

```bash
git add .
```

without initializing Git.

Git may show:

```text
fatal: not a git repository
```

### Solution

Open the correct project folder and run:

```bash
git init
```

---

## 10. Confusing Git and GitHub

### Common Mistake

Thinking that installing Git automatically creates or uploads a GitHub repository.

### Difference

```text
Git
→ Version control system
→ Works locally

GitHub
→ Online platform
→ Hosts Git repositories
```

Git and GitHub work together, but they are not the same thing.

---

## 11. Forgetting to Connect the GitHub Remote

### Problem

The local repository exists, but it is not connected to GitHub.

### Solution



A
