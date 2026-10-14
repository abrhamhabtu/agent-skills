---
name: seo-skills
description: "SEO + AEO skill pack for agents (Illyism/seo-skills). Use for technical SEO audits, title-tag optimization, blog refreshes, SERP intent mapping, comparison pages, backlinks, and checking what ChatGPT/Perplexity cite in a niche. Load the specific sub-skill under seo/, marketing/, content/, or copywriting/."
version: 1.0.0
---

# SEO Skills (Illyism)

**Source:** https://github.com/Illyism/seo-skills  (X: @illyism)

Open-source SEO + AEO skill pack for Claude Code, Cursor, Codex and any agent that reads SKILL.md.

## When to Use
- Audit a codebase for technical SEO and broken metadata.
- Optimize title tags / meta; refresh slipping blog posts.
- Map search intent, build comparison pages with real information gain.
- Check what ChatGPT and Perplexity cite for a niche (AEO).
- Write ranking copy, backlinks, customer-journey and GTM copy.

## Sub-skills (11)
- **seo/**: blitz-seo, seo-autopilot, blog-refresher, seo-title-optimization, linkdr
- **marketing/**: diff-marketing, customer-journey
- **content/**: scribiz, intro
- **copywriting/**: blitz-copy, understand-customers

Load the matching sub-skill directory (each has its own SKILL.md).

## Install (agent-native)
```
npx skills add Illyism/seo-skills --skill seo-autopilot   # single
npx skills add Illyism/seo-skills                          # all
```
