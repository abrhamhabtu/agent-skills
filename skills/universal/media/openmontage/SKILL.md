---
name: openmontage
description: "Open-source agentic video production system. Use when turning a prompt, YouTube link, or local clip into a planned, scripted, composed video (12 pipeline products; flat-lay shorts ~$1-4)."
version: 1.0.0
---

# Openmontage

**Source:** https://github.com/calesthio/OpenMontage  (ranked top-15 Hermes skill list)

## When to Use
Use when turning a prompt, YouTube link, or local clip into a planned, scripted, composed video (12 pipeline products; flat-lay shorts ~$1-4) when the trigger applies.

## Install
```
python3 -m venv .venv && source .venv/bin/activate && python -m pip install -r requirements.txt && cd remotion-composer && npm install && cd .. && python -m pip install piper-tts && cp .env.example .env   # + brew install ffmpeg
```

## Usage
python -m backlot open                  # live production board (library)
python -m backlot open <project-id>      # one production
Work is pipeline-driven: pipeline_defs/ + stage director skills under skills/pipelines/.
