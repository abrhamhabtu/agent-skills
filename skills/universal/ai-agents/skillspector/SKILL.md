---
name: skillspector
description: "Security scanner for AI-agent skills. Use to scan/vet any skill (Claude/Codex/Gemini/OpenCode/Hermes) for vulnerabilities or malicious patterns BEFORE installing (26% of skills have vulns; 5% malicious)."
version: 1.0.0
---

# Skillspector

**Source:** https://github.com/NVIDIA/SkillSpector  (ranked top-15 Hermes skill list)

## When to Use
Use to scan/vet any skill (Claude/Codex/Gemini/OpenCode/Hermes) for vulnerabilities or malicious patterns BEFORE installing (26% of skills have vulns; 5% malicious) when the trigger applies.

## Install
```
uv tool install git+https://github.com/NVIDIA/skillspector.git
# update: uv tool update skillspector
# with MCP: install with the mcp extra
```

## Usage
skillspector scan <skill-path-or-repo>
skillspector mcp   # expose as MCP server to gate installs
