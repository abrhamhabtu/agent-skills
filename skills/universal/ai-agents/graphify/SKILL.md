---
name: graphify
description: "Codebase knowledge-graph skill+CLI. Use when you need a clickable concept graph of a repo (nodes=concepts, edges=APIs, colored=communities) before architecting/refactoring/ramping on unfamiliar code."
version: 1.0.0
---

# Graphify

**Source:** https://github.com/Graphify-Labs/graphify  (ranked top-15 Hermes skill list)

## When to Use
Use when you need a clickable concept graph of a repo (nodes=concepts, edges=APIs, colored=communities) before architecting/refactoring/ramping on unfamiliar code when the trigger applies.

## Install
```
uv tool install graphifyy   # or pipx install graphifyy
uv tool run graphifyy install   # register with Claude Code/Cursor/Codex/Gemini/...
```

## Usage
graphify <path-to-repo>  -> produces graph.html (open in browser); graphify install registers the skill with the chosen AI assistant. Works in Claude Code, Cursor, Codex, Gemini CLI, Copilot + 15 platforms.
