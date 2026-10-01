---
name: skill-seekers
description: "Convert documentation websites, GitHub repos, and PDFs into Claude/agent skills. Use when you want a new skill built from existing public material instead of writing it by hand."
version: 1.0.0
---

# Skill-seekers

**Source:** https://github.com/yusufkaraaslan/Skill_Seekers  (ranked top-15 Hermes skill list)

## When to Use
Use when you want a new skill built from existing public material instead of writing it by hand when the trigger applies.

## Install
```
pip install skill-seekers
# or uv tool install skill-seekers
```

## Usage
skillseekers <url-or-repo-or-pdf> --target <output-dir>   # builds a SKILL.md + support files
