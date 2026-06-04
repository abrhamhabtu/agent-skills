# Cursor Frontend Design

Use when building UI with Cursor IDE.

## Rules

1. Check for .cursorrules, create if missing
2. Use TypeScript with explicit return types
3. Group files by feature, kebab-case naming
4. Use Cursor's /thermo-nuclear-code-quality-review for deep analysis
5. Keep components under 200 lines
6. Use Vitest for unit tests, Playwright for E2E

## Anti-Patterns

- Ignoring .cursorrules
- Accepting AI-generated code without review
- Skipping API type definitions
- Magic numbers and hardcoded strings
