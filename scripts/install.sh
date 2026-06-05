#!/bin/bash
# Agent Skills Installer
# Usage: ./install.sh [hermes|claude|cursor|opencode|all]

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENT="${1:-all}"

echo "Installing agent skills from $REPO_DIR..."

case "$AGENT" in
  hermes)
    echo "Installing Hermes skills..."
    # Universal skills
    for skill in "$REPO_DIR"/skills/universal/*/*; do
      if [ -d "$skill" ] && [ -f "$skill/SKILL.md" ]; then
        name=$(basename "$skill")
        target="$HOME/.hermes/skills/$name"
        mkdir -p "$target"
        cp "$skill"/* "$target"/ 2>/dev/null || true
        echo "  ✓ $name"
      fi
    done
    # Hermes-specific skills
    for skill in "$REPO_DIR"/skills/hermes/*/*; do
      if [ -d "$skill" ] && [ -f "$skill/SKILL.md" ]; then
        name=$(basename "$skill")
        target="$HOME/.hermes/skills/$name"
        mkdir -p "$target"
        cp "$skill"/* "$target"/ 2>/dev/null || true
        echo "  ✓ $name (Hermes-specific)"
      fi
    done
    echo "Hermes skills installed to ~/.hermes/skills/"
    ;;
    
  claude)
    echo "Installing Claude Code skills..."
    # Claude looks for CLAUDE.md in project root
    # We'll create a combined CLAUDE.md
    cat "$REPO_DIR/AGENTS.md" > "$HOME/.claude/CLAUDE.md" 2>/dev/null || echo "Note: Create ~/.claude/ directory first"
    echo "Claude skills reference updated"
    ;;
    
  cursor)
    echo "Installing Cursor skills..."
    # Cursor uses .cursorrules in project root
    cp "$REPO_DIR/.cursorrules" "$HOME/.cursor/.cursorrules" 2>/dev/null || echo "Note: Create ~/.cursor/ directory first"
    echo "Cursor skills reference updated"
    ;;
    
  opencode)
    echo "Installing OpenCode skills..."
    # OpenCode can use AGENTS.md format
    mkdir -p "$HOME/.opencode/skills"
    for skill in "$REPO_DIR"/skills/universal/*/* "$REPO_DIR"/skills/opencode/*/*; do
      if [ -d "$skill" ] && [ -f "$skill/SKILL.md" ]; then
        name=$(basename "$skill")
        target="$HOME/.opencode/skills/$name"
        mkdir -p "$target"
        cp "$skill"/* "$target"/ 2>/dev/null || true
        echo "  ✓ $name"
      fi
    done
    echo "OpenCode skills installed to ~/.opencode/skills/"
    ;;
    
  all)
    echo "Installing all skills..."
    $0 hermes
    $0 claude
    $0 cursor
    $0 opencode
    echo ""
    echo "All skills installed!"
    ;;
    
  *)
    echo "Usage: $0 [hermes|claude|cursor|opencode|all]"
    echo ""
    echo "Installs skills for the specified agent:"
    echo "  hermes   → ~/.hermes/skills/"
    echo "  claude   → ~/.claude/CLAUDE.md"
    echo "  cursor   → ~/.cursor/.cursorrules"
    echo "  opencode → ~/.opencode/skills/"
    echo "  all      → All of the above"
    exit 1
    ;;
esac

echo ""
echo "Done!"
