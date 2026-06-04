---
name: claude-frontend-design
description: Frontend design guidelines optimized for Claude Code. Use when building UI with Claude Code to ensure proper CLAUDE.md conventions and component quality.
triggers:
  - claude
  - claude-code
  - frontend
  - react
  - nextjs
  - tailwind
  - ui
agent: claude-code
---

# Claude Code Frontend Design

## When to Use

Building user-facing UI with Claude Code. This skill ensures CLAUDE.md conventions are followed and components meet production standards.

## Steps

1. **Load CLAUDE.md context**
   - Check for existing CLAUDE.md in project root
   - If missing, create one with project-specific rules
   - Reference Karpathy coding guidelines: think before coding, simplicity first, surgical changes, goal-driven execution

2. **Component quality standards**
   - Use TypeScript with strict mode enabled
   - Export components with named exports (not default)
   - Include JSDoc comments for public APIs
   - Write components that are testable and composable

3. **File organization**
   - Co-locate related files: Component.tsx, Component.test.tsx, Component.stories.tsx
   - Use barrel exports (index.ts) for clean imports
   - Keep page components in app/ or pages/, reusable components in components/

4. **Styling approach**
   - Prefer Tailwind CSS with @apply for complex utilities
   - Use CSS modules when Tailwind is insufficient
   - Maintain design tokens in a central theme file

5. **Testing strategy**
   - Write tests before implementation (TDD when possible)
   - Use React Testing Library for component tests
   - Mock external dependencies, test behavior not implementation

6. **Performance checklist**
   - Code-split with dynamic imports for routes
   - Use React.memo for expensive renders
   - Implement virtualization for long lists
   - Profile with React DevTools Profiler

## Pitfalls

- **Don't** write components without types
- **Don't** use default exports for components
- **Don't** skip tests for "simple" components
- **Don't** ignore accessibility (a11y) in component design
- **Don't** use inline styles except for dynamic values

## Claude Code Specific

When working with Claude Code:
- Use `/add` to include relevant files in context
- Use `/test` to run tests after changes
- Use `/commit` with descriptive messages
- Reference skills with `@skill-name` syntax if supported
