---
name: universal-obsidian-workflows
description: Organize knowledge, research, and project notes in Obsidian with structured vaults, templates, and linked thinking. Use when setting up knowledge management, research dossiers, or second brain systems.
triggers:
  - obsidian
  - knowledge-management
  - second-brain
  - research
  - notes
  - markdown
  - zettelkasten
  - vault
agent: universal
---

# Obsidian Workflows

## When to Use

Setting up or maintaining an Obsidian vault for knowledge management, research, project tracking, or personal second brain.

## Vault Structure

```
Obsidian Brain/
├── 00-Inbox/              # Capture everything here first
├── 01-Projects/           # Active projects
│   ├── trade-pilot/
│   ├── party-bus/
│   └── av-fleet/
├── 02-Areas/              # Ongoing responsibilities
│   ├── health/
│   ├── finance/
│   └── relationships/
├── 03-Resources/          # Reference material
│   ├── books/
│   ├── articles/
│   └── courses/
├── 04-Archive/            # Completed/inactive
├── 05-Daily/              # Daily notes (YYYY-MM-DD)
├── 06-Meetings/           # Meeting notes
├── 07-Research/           # Research dossiers
│   └── 12-Assignments/    # School/work assignments
├── Templates/             # Note templates
└── Attachments/           # Images, PDFs
```

## Core Workflows

### 1. Capture (Inbox)

- Dump everything into `00-Inbox/` without organizing
- Use quick capture: mobile app, desktop shortcut, or Alfred
- Process inbox weekly (PARA method)

### 2. Process (PARA)

For each item in inbox, decide:
- **Project**: Has a deadline or specific outcome → `01-Projects/`
- **Area**: Ongoing responsibility → `02-Areas/`
- **Resource**: Reference for later → `03-Resources/`
- **Archive**: No longer relevant → `04-Archive/`

### 3. Link (Zettelkasten)

- Every note should link to at least 2 others
- Use `[[WikiLinks]]` for connections
- Create MOCs (Maps of Content) for overview
- Tag with #status/active, #status/seedling, #status/evergreen

### 4. Templates

```markdown
---
title: "{{title}}"
date: {{date:YYYY-MM-DD}}
tags: [seedling]
---

# {{title}}

## Summary

## Key Points

## Connections
- [[Related Note 1]]
- [[Related Note 2]]

## Actions
- [ ] 

## References
```

### 5. Research Dossiers

```markdown
---
title: "Research: {{topic}}"
date: {{date:YYYY-MM-DD}}
tags: [research, active]
---

# Research: {{topic}}

## Objective
What are we trying to learn?

## Sources
| Source | URL | Notes |
|--------|-----|-------|
| | | |

## Key Findings

## Open Questions

## Next Steps
```

## Plugins (Essential)

- **Templater**: Advanced templates with JavaScript
- **Dataview**: Query notes like a database
- **Calendar**: Daily notes navigation
- **Periodic Notes**: Weekly/monthly reviews
- **Git**: Version control for vault
- **Advanced Tables**: Better table editing
- **QuickAdd**: Capture templates

## Pitfalls

- Don't over-organize before capturing
- Don't create folders too early (start flat)
- Don't forget to link (orphan notes are useless)
- Don't use Obsidian as a task manager (use TickTick/Todoist)
- Don't sync without git or Obsidian Sync

## Sync Strategy

1. **Git**: Free, versioned, works with any device
   ```bash
   cd "Obsidian Brain"
   git init
   git add .
   git commit -m "Initial vault"
   git push origin main
   ```

2. **Obsidian Sync**: Paid, seamless, end-to-end encrypted

3. **iCloud/Dropbox**: Simple but no version history

## Daily Workflow

1. Open daily note (Ctrl/Cmd + T)
2. Review yesterday's unfinished tasks
3. Capture new ideas to inbox
4. Process inbox (10 min max)
5. Work on active projects
6. End of day: update project notes
