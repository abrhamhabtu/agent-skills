# Frontend Design Guidelines

Use when building user-facing UI with any AI agent.

## Rules

1. Check for existing design system first
2. Use premium component libraries (Radix, shadcn/ui, Tailwind UI)
3. Establish typography hierarchy with max 2 fonts
4. Define color system with HSL/OKLCH, light/dark variants
5. Use 8-point spacing scale
6. Build accessible components (keyboard, ARIA, focus)
7. Mobile-first responsive design
8. Optimize images and minimize layout shift

## Anti-Patterns

- Inline styles
- Hardcoded values
- Missing focus states
- px font sizes (use rem)
- Overly generic or overly specific components
