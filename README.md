# Agent Skills

Personal, syncable agent skills library for Claude Code, Cursor, Hermes, OpenCode, and universal agents.

## Quick Start

```bash
# Install all skills globally
npx skills add openclaw/agent-skills --all -g

# Install specific skill categories
npx skills add openclaw/agent-skills --skill "hermes-frontend" -g
npx skills add openclaw/agent-skills --skill "claude-code-review" -g

# List available skills
npx skills add openclaw/agent-skills --list
```

## Repo Structure

```
agent-skills/
├── skills/
│   ├── universal/          # Works with any agent (AGENTS.md format)
│   │   ├── frontend/
│   │   ├── backend/
│   │   ├── devops/
│   │   ├── ai-agents/
│   │   ├── productivity/
│   │   └── security/
│   ├── claude-code/        # Claude Code specific (CLAUDE.md + SKILL.md)
│   │   ├── frontend/
│   │   ├── backend/
│   │   ├── devops/
│   │   ├── ai-agents/
│   │   ├── productivity/
│   │   └── security/
│   ├── cursor/             # Cursor specific (.cursorrules + SKILL.md)
│   │   ├── frontend/
│   │   ├── backend/
│   │   ├── devops/
│   │   ├── ai-agents/
│   │   ├── productivity/
│   │   └── security/
│   ├── hermes/             # Hermes specific
│   │   ├── frontend/
│   │   ├── backend/
│   │   ├── devops/
│   │   ├── ai-agents/
│   │   ├── productivity/
│   │   └── security/
│   └── opencode/           # OpenCode specific
│       ├── frontend/
│       ├── backend/
│       ├── devops/
│       ├── ai-agents/
│       ├── productivity/
│       └── security/
├── AGENTS.md               # Universal agent instructions
├── CLAUDE.md               # Claude Code entrypoint (symlink to AGENTS.md)
├── .cursorrules            # Cursor entrypoint
├── skills.sh.json          # skills.sh display config
└── README.md               # This file
```

## Skill Categories

| Category | Description |
|----------|-------------|
| **frontend** | React, Next.js, Tailwind, UI/UX patterns |
| **backend** | APIs, databases, auth, serverless |
| **devops** | CI/CD, Docker, cloud, infra |
| **ai-agents** | Agent engineering, prompts, orchestration |
| **productivity** | Workflows, automation, tooling |
| **security** | Auth, secrets, audit patterns |

## Sync Strategy

1. **Primary source**: This GitHub repo
2. **Per-machine install**: `npx skills add openclaw/agent-skills --all -g`
3. **Update flow**: Edit here, push, re-install on each machine
4. **Local overrides**: Machine-specific tweaks go in `~/.local/skills/`

## Adding a New Skill

1. Create folder: `skills/<agent>/<category>/<skill-name>/`
2. Add `SKILL.md` with YAML frontmatter
3. Add `AGENTS.md` (universal) or agent-specific entrypoint
4. Add `metadata.json` for skills.sh indexing
5. Update `skills.sh.json` to categorize
6. Test: `npx skills add . --skill <skill-name>`

## License

MIT
