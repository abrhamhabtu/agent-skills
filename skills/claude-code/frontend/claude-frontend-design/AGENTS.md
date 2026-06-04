# Claude Code Frontend Design

Use when building UI with Claude Code.

## Rules

1. Check for existing CLAUDE.md, create if missing
2. Use TypeScript strict mode, named exports only
3. Co-locate related files (Component.tsx, test, stories)
4. Use Tailwind CSS with @apply for complex utilities
5. Write tests before implementation when possible
6. Code-split routes, use React.memo for expensive renders

## Anti-Patterns

- Untyped components
- Default exports for components
- Skipping tests
- Ignoring accessibility
- Inline styles (except dynamic values)
