# Universal Agent Skills Library

This repository contains reusable skills for AI coding agents. Each skill lives in its own folder under `skills/` and includes a `SKILL.md` file with procedural knowledge.

## How to Use

1. **Install the skills CLI**: `npm install -g skills`
2. **Install skills**: `skills add openclaw/agent-skills`
3. **Use a skill**: The agent will automatically load relevant skills based on trigger conditions in each `SKILL.md`.

## Skill Structure

Each skill folder contains:
- `SKILL.md` - The skill definition with trigger conditions, steps, and pitfalls
- `AGENTS.md` - Agent-specific instructions (optional)
- `metadata.json` - Indexing metadata for skills.sh
- `README.md` - Human-readable documentation (optional)

## Categories

- **frontend**: React, Next.js, Tailwind, UI/UX
- **backend**: APIs, databases, auth, serverless
- **devops**: CI/CD, Docker, cloud, infra
- **ai-agents**: Agent engineering, prompts, orchestration
- **productivity**: Workflows, automation, tooling
- **security**: Auth, secrets, audit patterns

## Contributing

1. Create a new folder under the appropriate `skills/<agent>/<category>/`
2. Write a `SKILL.md` following the template
3. Add `metadata.json`
4. Test locally: `skills add . --skill <your-skill>`
5. Submit a PR
