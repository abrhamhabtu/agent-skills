# Hermes Frontend Design

Use when building UI with Hermes Agent.

## Rules

1. Load `universal-frontend-design` first, then apply Hermes overrides
2. Atheros style: Inter font, rounded corners, soft shadows, status dots, clean SaaS, restrained orange accents
3. Check `~/.hermes/skills/` for local skills before building
4. New projects go to `~/Developer/Active/<project>/`, never inside existing roots
5. Use React + TypeScript + Tailwind
6. Use React Query for server state, React Hook Form + Zod for forms
7. Handle loading, error, and empty states explicitly

## Anti-Patterns

- Dropping files into existing project roots (breaks their dev server)
- Ignoring Hermes skill conventions
- Using em-dashes in UI copy
- Writing new projects into `jarvis-ui/`
