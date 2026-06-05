#!/bin/bash
# Agent Skills Sync Script
# Usage: ./sync.sh [auto|push|pull|status]

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMAND="${1:-status}"

cd "$REPO_DIR"

case "$COMMAND" in
  auto)
    # Auto-sync: pull if clean, else notify
    if git diff --quiet && git diff --cached --quiet; then
      echo "Pulling latest skills..."
      git pull origin main || echo "Could not pull (maybe offline)"
      echo "Reinstalling..."
      "$REPO_DIR/scripts/install.sh" all
    else
      echo "Local changes detected. Run './sync.sh push' to sync up."
    fi
    ;;
    
  push)
    echo "Pushing local skills to remote..."
    if [ -n "$(git status --porcelain)" ]; then
      git add -A
      read -p "Commit message: " msg
      git commit -m "${msg:-Update skills $(date +%Y-%m-%d)}"
    fi
    git push origin main || echo "Push failed. Check your internet connection."
    echo "Skills pushed!"
    ;;
    
  pull)
    echo "Pulling latest skills from remote..."
    git pull origin main
    echo "Reinstalling..."
    "$REPO_DIR/scripts/install.sh" all
    echo "Skills updated!"
    ;;
    
  status)
    echo "=== Agent Skills Sync Status ==="
    echo ""
    echo "Repository: $REPO_DIR"
    echo "Remote: $(git remote get-url origin 2>/dev/null || echo 'Not configured')"
    echo ""
    echo "Git status:"
    git status --short
    echo ""
    echo "Installed skills:"
    echo "  Hermes:   $(ls ~/.hermes/skills/ 2>/dev/null | wc -l | tr -d ' ') skills"
    echo "  OpenCode: $(ls ~/.opencode/skills/ 2>/dev/null | wc -l | tr -d ' ') skills"
    echo ""
    echo "Usage:"
    echo "  ./sync.sh auto   - Auto pull if clean"
    echo "  ./sync.sh push   - Commit and push"
    echo "  ./sync.sh pull   - Pull and reinstall"
    echo "  ./sync.sh status - Show this status"
    ;;
    
  *)
    echo "Usage: $0 [auto|push|pull|status]"
    exit 1
    ;;
esac
