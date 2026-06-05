# Obsidian Workflows (Quick Reference)

## PARA Method

| Folder | Content | Example |
|--------|---------|---------|
| 00-Inbox | Unprocessed captures | Raw notes, ideas |
| 01-Projects | Goals with deadlines | Build app, Write paper |
| 02-Areas | Ongoing responsibilities | Health, Finance |
| 03-Resources | Reference material | Books, Articles |
| 04-Archive | Completed/inactive | Old projects |

## Essential Plugins

- **Templater**: Dynamic templates
- **Dataview**: Query notes
- **Calendar**: Daily notes
- **Git**: Version control

## Daily Note Template

```markdown
---
date: {{date:YYYY-MM-DD}}
---

## Morning
- [ ] Review yesterday

## Notes

## Actions
- [ ] 

## Links
- [[Yesterday]] | [[Tomorrow]]
```

## Research Dossier Template

```markdown
---
title: "Research: {{topic}}"
date: {{date:YYYY-MM-DD}}
tags: [research]
---

## Objective
## Sources
## Key Findings
## Next Steps
```

## Rules

1. Capture to inbox first
2. Process inbox weekly
3. Link every note to 2+ others
4. Use tags: #seedling #evergreen #active
5. Sync via git or Obsidian Sync
