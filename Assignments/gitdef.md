WHAT IS GIT?

* Definition: Git is a distributed version control system (DVCS) designed to track changes in source code across the entire development lifecycle.
* Storage Mechanism: Instead of saving differences between file versions (deltas), Git captures full snapshots of the project directory over time.
* Distributed Nature: Every developer maintains a complete local clone of the repository, including its entire historical log, allowing full offline work without depending on a central server.
* The Three Operational Areas:
  - Working Directory: The actual folder on your machine where files are edited, added, or deleted.
  - Staging Area (Index): An intermediate preparation layer where specific modifications are staged before committing.
  - Local Repository (.git): The permanent database that stores committed snapshots, metadata, and cryptographic hashes.

OPERATIONAL WORKFLOW (STEP-BY-STEP)

1. INITIAL CONFIGURATION
* Purpose: Sets your name and email on every commit you create.
* When/Where: Run once in your terminal when setting up Git on your computer.
* Commands:
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"

2. PROJECT INITIALIZATION OR CLONING
* Purpose: Starts version control for a new or existing codebase.
* When/Where: Run inside the project root folder.
* Commands:
  - For a new local folder:
    git init
  - To download an existing repository from GitHub:
    git clone https://github.com/username/repository.git

3. CHECKING WORKSPACE STATUS
* Purpose: Displays which files are modified, untracked, or ready to be committed.
* When/Where: Run frequently before staging and committing.
* Command:
  git status

4. STAGING CHANGES
* Purpose: Moves modified files from the working directory to the staging area.
* When/Where: Run after modifying files when you are ready to prepare a commit.
* Commands:
  - Single file:
    git add filename.ext
  - All modified and new files:
    git add .

5. COMMITTING SNAPSHOTS
* Purpose: Permanently saves the staged snapshot to the local repository history.
* When/Where: Run once changes are staged and represent a completed unit of work.
* Command:
  git commit -m "Brief imperative description of changes"

6. BRANCHING AND ISOLATION
* Purpose: Allows you to build features or fix bugs without affecting the stable main branch.
* When/Where: Run before starting a new feature, then merge back when done.
* Commands:
  - Create and switch to new branch:
    git switch -c feature-name
  - Switch back to main:
    git switch main
  - Merge the feature branch into main:
    git merge feature-name

7. REMOTE SYNCHRONIZATION
* Purpose: Uploads local commits to a cloud platform (GitHub) or downloads updates from teammates.
* When/Where: Run to share your code or sync with remote changes.
* Commands:
  - Link to remote repository (run once):
    git remote add origin https://github.com/username/repository.git
  - Push local commits to remote:
    git push -u origin main
  - Fetch and integrate remote updates:
    git pull origin main

8. TEMPORARY STASHING AND UNDOING
* Purpose: Shelves uncommitted work temporarily or reverts unwanted changes.
* When/Where: Run when switching tasks abruptly or fixing mistakes.
* Commands:
  - Save uncommitted work temporarily:
    git stash
  - Bring back stashed work:
    git stash pop
  - Discard uncommitted changes in a specific file:
    git restore filename.ext
  - Unstage a file without losing its edits:
    git restore --staged filename.ext
    git pull
    