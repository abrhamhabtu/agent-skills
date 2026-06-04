---
name: hermes-frontend-design
description: Frontend design guidelines optimized for Hermes Agent. Use when building UI with Hermes to ensure Atheros-style consistency and proper skill loading.
triggers:
  - hermes
  - frontend
  - react
  - nextjs
  - tailwind
  - ui
  - atheros
agent: hermes
---

# Hermes Frontend Design

## When to Use

Building user-facing UI with Hermes Agent. This skill ensures the Atheros design language is applied consistently and that Hermes-specific conventions are followed.

## Steps

1. **Load the design skill first**
   - Before generating UI, load `universal-frontend-design` for base principles
   - Then apply Hermes-specific overrides below

2. **Atheros design language**
   - Font: Inter (primary), system-ui fallback
   - Border radius: rounded corners (8px-16px for cards, 4px-8px for buttons)
   - Shadows: soft, diffuse shadows (0 4px 24px rgba(0,0,0,0.08))
   - Status indicators: colored dots (green active, amber warning, red error)
   - Clean SaaS aesthetic with generous whitespace
   - Restrained orange accents (#F97316 or similar) for CTAs and highlights

3. **Hermes-specific conventions**
   - Use the `skill_view` tool to load relevant skills before UI tasks
   - Check `~/.hermes/skills/` for locally installed skills that may have design constraints
   - When building for Jarvis UI, respect the localhost:5180 dev server setup
   - New projects go to `~/Developer/Active/<project-name>/`, never inside existing project roots

4. **Component structure**
   - Use React + TypeScript + Tailwind CSS
   - Prefer functional components with hooks
   - Use `cn()` utility for conditional class merging
   - Keep components in `app/components/` or `src/components/`

5. **State management**
   - Start with React useState/useReducer
   - Elevate to Zustand or Jotai only when prop drilling becomes painful
   - Never use Redux for new projects unless explicitly required

6. **Data fetching**
   - Use React Query (TanStack Query) for server state
   - Use SWR for simple cases
   - Always handle loading, error, and empty states

7. **Form handling**
   - Use React Hook Form for complex forms
   - Use Zod for schema validation
   - Display field-level errors with inline messages

## Pitfalls

- **Don't** drop static HTML into existing project roots (breaks their dev server)
- **Don't** ignore Hermes skill loading conventions (always check skills first)
- **Don't** use em-dashes in UI copy (user preference: use commas or parentheses)
- **Don't** forget to save new skills to `~/.hermes/skills/` after creation
- **Don't** write new project files into `jarvis-ui/` unless explicitly asked

## Hermes Tool Integration

When building UI that interacts with Hermes tools:

| Tool | UI Pattern |
|------|-----------|
| `skill_view` | Skill browser/inspector card |
| `memory` | Preference settings panel |
| `todo` | Task list with status indicators |
| `cronjob` | Schedule editor with recurrence UI |
| `delegate_task` | Worker pool dashboard |
| `browser_*` | URL input + snapshot preview |
| `terminal` | Terminal emulator panel |
| `web_search` | Search bar with results cards |
| `image_generate` | Prompt input + gallery grid |
| `text_to_speech` | Audio player with transcript |

## Examples

### Hermes Skill Card Component
```tsx
interface SkillCardProps {
  name: string;
  description: string;
  category: string;
  installed: boolean;
}

export function SkillCard({ name, description, category, installed }: SkillCardProps) {
  return (
    <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm hover:shadow-md transition-shadow">
      <div className="flex items-start justify-between">
        <div>
          <h3 className="font-semibold text-slate-900">{name}</h3>
          <p className="mt-1 text-sm text-slate-600">{description}</p>
        </div>
        <span className={cn(
          "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium",
          installed
            ? "bg-green-50 text-green-700"
            : "bg-slate-100 text-slate-600"
        )}>
          <span className={cn("mr-1.5 h-1.5 w-1.5 rounded-full", installed ? "bg-green-500" : "bg-slate-400")} />
          {installed ? "Installed" : "Available"}
        </span>
      </div>
      <div className="mt-4 flex items-center gap-2">
        <span className="rounded-md bg-orange-50 px-2 py-1 text-xs font-medium text-orange-700">
          {category}
        </span>
      </div>
    </div>
  );
}
```
