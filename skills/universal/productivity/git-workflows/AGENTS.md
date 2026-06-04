# Universal Git Workflows

Use when working with git or GitHub.

## Rules

1. Branch naming: `feature/`, `bugfix/`, `hotfix/`, `refactor/`, `docs/`
2. Conventional commits: `type(scope): subject`
3. Commit early and often, each commit a logical unit
4. Keep PRs under 400 lines, include what/why/how
5. Squash merge features, regular merge releases
6. Set up pre-commit hooks for lint, type check, tests

## Anti-Patterns

- Committing secrets or sensitive data
- Vague commit messages
- Giant PRs
- Committing without review
- Ignoring merge conflicts
