---
name: universal-git-workflows
description: Git workflow best practices for any AI agent. Use when creating branches, committing, merging, or managing repositories. Triggers on git, branch, commit, merge, PR, or repository tasks.
triggers:
  - git
  - branch
  - commit
  - merge
  - pull-request
  - repository
  - github
agent: universal
---

# Universal Git Workflows

## When to Use

Creating branches, making commits, merging code, or managing repositories. This skill ensures consistent, clean git history.

## Steps

1. **Branch naming**
   - `feature/description` for new features
   - `bugfix/description` for bug fixes
   - `hotfix/description` for production fixes
   - `refactor/description` for code refactoring
   - `docs/description` for documentation changes
   - Use kebab-case, keep under 50 characters

2. **Commit messages**
   - Use conventional commits format:
     ```
     type(scope): subject
     
     body (optional)
     
     footer (optional)
     ```
   - Types: feat, fix, docs, style, refactor, test, chore
   - Subject: imperative mood, no period, under 50 chars
   - Body: explain what and why, not how, wrap at 72 chars

3. **Commit frequency**
   - Commit early, commit often
   - Each commit should be a logical unit
   - Don't commit broken code (unless marked WIP)
   - Use `git add -p` for granular staging

4. **Branch strategy**
   - Main branch: `main` (production-ready)
   - Development branch: `develop` (integration)
   - Feature branches: fork from `develop`
   - Release branches: fork from `develop`, merge to `main`
   - Hotfix branches: fork from `main`, merge to both

5. **Pull requests**
   - Keep PRs small and focused (under 400 lines)
   - Include description with what, why, and how
   - Link related issues
   - Request review from at least one person
   - Ensure CI passes before merging

6. **Merging**
   - Use squash merge for feature branches (clean history)
   - Use regular merge for release branches (preserve commits)
   - Never force push to shared branches
   - Delete branches after merging

## Pitfalls

- **Don't** commit sensitive data (secrets, passwords, API keys)
- **Don't** write vague commit messages ("fix stuff", "update")
- **Don't** make giant PRs that are hard to review
- **Don't** commit without reviewing changes first
- **Don't** ignore merge conflicts (resolve carefully)

## Git Hooks

Set up pre-commit hooks for:
- Linting (ESLint, Prettier)
- Type checking
- Test running (unit tests)
- Secret scanning (gitleaks)

```bash
# Using husky
npx husky-init && npm install
npx husky add .husky/pre-commit "npm run lint && npm run test"
```
