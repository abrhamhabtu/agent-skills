---
name: opencode-frontend-design
description: Frontend design guidelines optimized for OpenCode CLI. Use when building UI with OpenCode to ensure proper Go-based tooling and DV4 Flash model considerations.
triggers:
  - opencode
  - opencode-go
  - frontend
  - react
  - nextjs
  - tailwind
  - ui
agent: opencode
---

# OpenCode Frontend Design

## When to Use

Building user-facing UI with OpenCode CLI (opencode-go with DV4 Flash / Kimi K2.6). This skill ensures OpenCode-specific conventions are followed.

## Steps

1. **Understand OpenCode limitations**
   - OpenCode Go can be unreliable for complex tasks
   - Prefer Kimi K2.6 for coding tasks when available
   - Use OpenCode for simple, well-defined changes

2. **Project setup**
   - Initialize with Next.js or Vite
   - Use TypeScript by default
   - Configure ESLint and Prettier in init

3. **Component approach**
   - Write simple, focused components
   - Avoid complex logic in components (extract to hooks/utils)
   - Use clear variable names (OpenCode benefits from explicit naming)

4. **Styling**
   - Use Tailwind CSS for rapid development
   - Keep class names simple and readable
   - Avoid complex CSS animations (may confuse the model)

5. **File changes**
   - Make small, atomic changes
   - Review each change before accepting
   - Use git to track changes and revert if needed

## Pitfalls

- **Don't** ask OpenCode to do complex refactoring in one shot
- **Don't** use ambiguous prompts (be explicit)
- **Don't** ignore compilation errors (OpenCode may miss them)
- **Don't** use bleeding-edge framework features
- **Don't** forget to test after each change

## OpenCode Specific

When working with OpenCode:
- Use clear, specific prompts
- Break large tasks into smaller steps
- Verify changes compile before proceeding
- Use `opencode review` for code review
