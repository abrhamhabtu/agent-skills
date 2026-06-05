# Agent Skills

Personal, syncable AI agent skills library. Works with Claude Code, Cursor, Hermes, OpenCode, and any AI agent that reads markdown instructions.

## What This Is

A curated collection of reusable skills (procedural knowledge) for AI coding agents. Each skill is a markdown file with:
- Trigger conditions (when to use)
- Step-by-step instructions
- Code examples
- Pitfalls to avoid

## Quick Start

```bash
# Clone on any machine
git clone https://github.com/openclaw/agent-skills.git ~/agent-skills

# Install skills for your agent
~/agent-skills/scripts/install.sh hermes    # For Hermes
~/agent-skills/scripts/install.sh claude    # For Claude Code
~/agent-skills/scripts/install.sh cursor    # For Cursor
~/agent-skills/scripts/install.sh opencode  # For OpenCode

# Or install all
~/agent-skills/scripts/install.sh all
```

## Repo Structure

```
agent-skills/
├── skills/
│   ├── universal/          # Works with ANY agent
│   │   ├── frontend/
│   │   │   ├── frontend-design/
│   │   │   └── ...
│   │   ├── backend/
│   │   │   ├── api-design/
│   │   │   ├── supabase-patterns/
│   │   │   └── ...
│   │   ├── devops/
│   │   │   ├── docker-workflows/
│   │   │   ├── cloudflare-workers/
│   │   │   └── ...
│   │   ├── ai-agents/
│   │   │   ├── agent-orchestration/
│   │   │   ├── voice-agent-integration/
│   │   │   └── ...
│   │   ├── productivity/
│   │   │   ├── git-workflows/
│   │   │   ├── obsidian-workflows/
│   │   │   └── ...
│   │   └── security/
│   │       └── security-hardening/
│   │
│   ├── claude-code/        # Claude Code specific
│   │   └── frontend/
│   │       └── claude-frontend-design/
│   ├── cursor/             # Cursor specific
│   │   └── frontend/
│   │       └── cursor-frontend-design/
│   ├── hermes/             # Hermes specific
│   │   └── ai-agents/
│   │       └── hermes-voice-bridge/
│   └── opencode/           # OpenCode specific
│       └── frontend/
│           └── opencode-frontend-design/
│
├── AGENTS.md               # Universal agent entrypoint
├── CLAUDE.md               # Claude Code entrypoint (symlink)
├── .cursorrules            # Cursor entrypoint
├── skills.sh.json          # Registry config
├── scripts/
│   ├── install.sh          # Per-agent installer
│   └── sync.sh             # Cross-machine sync
└── README.md               # This file
```

## Skill Format

Each skill lives in its own folder:

```
skill-name/
├── SKILL.md        # Full procedural knowledge
├── AGENTS.md       # Quick reference
└── metadata.json   # Indexing data
```

### SKILL.md Structure

```markdown
---
name: skill-name
description: What this skill does
triggers:
  - keyword1
  - keyword2
agent: universal  # or claude-code, cursor, hermes, opencode
---

# Skill Title

## When to Use

Conditions that trigger this skill.

## Steps

1. **Step one**
   - Sub-step
   - Sub-step

2. **Step two**
   ```code
   // Example
   ```

## Pitfalls

- Don't do X
- Don't do Y
```

## Current Skills

### Universal (Works with Any Agent)

| Skill | Category | Description |
|-------|----------|-------------|
| **frontend-design** | frontend | Production-grade UI/UX patterns |
| **api-design** | backend | REST/GraphQL API best practices |
| **supabase-patterns** | backend | Auth, RLS, edge functions |
| **docker-workflows** | devops | Containerization patterns |
| **cloudflare-workers** | devops | Edge compute, Durable Objects |
| **agent-orchestration** | ai-agents | Multi-agent workflows |
| **voice-agent-integration** | ai-agents | ElevenLabs, Twilio, WebRTC |
| **git-workflows** | productivity | Branching, commits, PRs |
| **obsidian-workflows** | productivity | Knowledge management |
| **security-hardening** | security | Auth, secrets, validation |

### Agent-Specific

| Skill | Agent | Description |
|-------|-------|-------------|
| **claude-frontend-design** | Claude Code | Claude-specific design rules |
| **cursor-frontend-design** | Cursor | Cursor-specific design rules |
| **hermes-voice-bridge** | Hermes | ElevenLabs → Hermes bridge |
| **opencode-frontend-design** | OpenCode | OpenCode-specific design rules |

## Sync Strategy (3 Computers)

### Setup on Each Machine

```bash
# 1. Clone repo
git clone https://github.com/openclaw/agent-skills.git ~/agent-skills

# 2. Install for your agents
~/agent-skills/scripts/install.sh all

# 3. Set up auto-sync (optional)
crontab -e
# Add: 0 * * * * ~/agent-skills/scripts/sync.sh auto
```

### Update Flow

```bash
# Edit skills on any machine
cd ~/agent-skills
vim skills/universal/backend/new-skill/SKILL.md

# Commit and push
git add .
git commit -m "Add new-skill skill"
git push

# On other machines, pull updates
cd ~/agent-skills
git pull
~/agent-skills/scripts/install.sh all
```

### Machine-Specific Overrides

Put local-only skills in:
- `~/.local/skills/` (universal)
- `~/.claude/skills/` (Claude Code)
- `~/.cursor/skills/` (Cursor)
- `~/.hermes/local-skills/` (Hermes)

These won't be synced but will be loaded by the agent.

## Adding a New Skill

1. Create folder: `skills/<agent>/<category>/<skill-name>/`
2. Write `SKILL.md` with YAML frontmatter
3. Add `AGENTS.md` for quick reference
4. Add `metadata.json`
5. Test locally
6. Commit and push

## ElevenLabs Voice Integration

Based on the [ElevenLabs X post](https://x.com/elevenlabsdevs/status/2062561944385519801), this repo includes skills for:

- **voice-agent-integration** (universal): General voice agent patterns
- **hermes-voice-bridge** (hermes-specific): Bridge ElevenLabs to Hermes

See those skills for implementation details.

## License

MIT
