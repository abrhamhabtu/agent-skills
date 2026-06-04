#!/bin/bash
# Agent Skills Sync Script
# Usage: ./scripts/sync.sh [install|update|list|push]

set -e

REPO_URL="https://github.com/openclaw/agent-skills"
LOCAL_SKILLS_DIR="$HOME/.local/skills"
GLOBAL_SKILLS_DIR="$HOME/.hermes/skills"

command="${1:-install}"

case "$command" in
  install)
    echo "Installing skills from $REPO_URL..."
    npx skills add "$REPO_URL" --all -g
    echo "Skills installed globally."
    ;;
  update)
    echo "Updating skills from $REPO_URL..."
    npx skills add "$REPO_URL" --all -g -y
    echo "Skills updated."
    ;;
  list)
    echo "Listing installed skills..."
    npx skills add "$REPO_URL" --list
    ;;
  push)
    echo "Pushing local skills back to repo..."
    if [ -d ".git" ]; then
      git add -A
      git commit -m "Update skills $(date +%Y-%m-%d)"
      git push
      echo "Skills pushed to $REPO_URL"
    else
      echo "Error: Not a git repository. Run from repo root."
      exit 1
    fi
    ;;
  *)
    echo "Usage: $0 [install|update|list|push]"
    echo ""
    echo "Commands:"
    echo "  install  Install all skills globally"
    echo "  update   Update installed skills"
    echo "  list     List available skills"
    echo "  push     Commit and push local changes"
    exit 1
    ;;
esac
