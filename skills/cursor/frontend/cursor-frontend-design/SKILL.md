---
name: cursor-frontend-design
description: Frontend design guidelines optimized for Cursor IDE. Use when building UI with Cursor to ensure .cursorrules conventions and proper use of Cursor's built-in tools.
triggers:
  - cursor
  - frontend
  - react
  - nextjs
  - tailwind
  - ui
agent: cursor
---

# Cursor Frontend Design

## When to Use

Building user-facing UI with Cursor IDE. This skill ensures .cursorrules conventions are followed and Cursor's built-in tools are used effectively.

## Steps

1. **Load .cursorrules context**
   - Check for existing .cursorrules in project root
   - If missing, create one with project-specific rules
   - Reference the agent skill library at ~/agents/skills/ if on macOS

2. **Use Cursor's built-in tools**
   - `/thermo-nuclear-code-quality-review` for deep code quality analysis
   - `@` mentions for context awareness
   - Composer for multi-file edits
   - Tab completion for rapid coding

3. **Component standards**
   - Use TypeScript with explicit return types
   - Prefer functional components with hooks
   - Use CSS-in-JS (styled-components) or Tailwind
   - Keep components under 200 lines, extract when larger

4. **File organization**
   - Group by feature, not by type
   - Use kebab-case for file names
   - Keep styles co-located or in adjacent .styles.ts file

5. **Code quality**
   - Run ESLint and Prettier on save
   - Use strict TypeScript configuration
   - Avoid any types, use unknown with type guards

6. **Testing**
   - Use Vitest for unit tests
   - Use Playwright for E2E tests
   - Mock API calls with MSW

## Pitfalls

- **Don't** ignore .cursorrules files
- **Don't** use Cursor's AI without reviewing generated code
- **Don't** skip type definitions for API responses
- **Don't** use magic numbers or hardcoded strings
- **Don't** forget to use Cursor's tab completion for repetitive patterns

## Cursor Specific

When working with Cursor:
- Use `@file` to reference specific files
- Use `@code` to reference code blocks
- Use `@web` for web search within Cursor
- Use `@docs` for documentation lookup
