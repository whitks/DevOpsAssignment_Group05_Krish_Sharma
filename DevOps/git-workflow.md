# Git Workflow & Branching Strategy

A predictable branching model keeps `main` always deployable and reviews
small and fast. This repo uses a lightweight **feature branch + PR** flow.

## Branching Model

| Branch | Purpose | Merged from |
|--------|---------|-------------|
| `main` | Production-stable; protected; always deployable | `krish_sharmadpp` etc. |
| `krish_sharmadpp` | Group member working branch | `main` |
| `feature/*` | A single feature or fix | `main` |
| `hotfix/*` | Urgent production fix | `main` |

## Rule of thumb

- Never commit directly to `main`.
- Open a Pull Request for every change and request a review.
- Keep PRs small (< 300 changed lines), with a link to the issue.

## Typical flow

```bash
# 1. Start from an up-to-date main
git checkout main
git pull origin main

# 2. Create a feature branch
git checkout -b feature/ci-pipeline

# 3. Work, then commit often
git add .
git commit -m "feat: add CI pipeline"

# 4. Push and open a Pull Request
git push -u origin feature/ci-pipeline
# -> open PR on GitHub, request review, wait for checks

# 5. After approval, merge (squash) and delete the branch
```

## Commit message conventions

Use [Conventional Commits](https://www.conventionalcommits.org):

- `feat:` — a new capability
- `fix:` — a bug fix
- `docs:` — documentation only
- `ci:` — CI/CD config changes
- `refactor:` — behavior-preserving code change
- `chore:` — maintenance, tooling

Example: `feat: add Prometheus alert rules for 5xx rates`

## Pull Request checklist

- [ ] Title and description explain the what and why.
- [ ] Referenced issue/assignment number.
- [ ] CI checks (lint, test) green.
- [ ] No secrets or large binary files committed.
- [ ] Screenshots attached for UI changes (if any).
- [ ] Reviewer approved.

## Merging strategy

Prefer **Squash and merge** for feature branches to keep `main` history clean
and linear; use a **merge commit** for integration branches like
`krish_sharmadpp`.