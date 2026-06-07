# /last30days

Use this skill when the user asks what people are saying, doing, buying, betting, or complaining about in the last 30 days.

Source of truth: read `SKILL.md` first, then run its resolver and scripts. Do not improvise a generic web search in place of the skill contract.

Default query style:

```bash
python3 scripts/last30days.py "<topic>"
```

Works zero-config for Reddit, Hacker News, Polymarket, GitHub, and web. Optional keys unlock X, YouTube, TikTok, Instagram, and other sources.
