---
name: universal-frontend-design
description: Production-grade frontend design guidelines for any AI agent. Use when building user-facing UI to avoid generic AI-generated slop. Triggers on React, Next.js, Tailwind, CSS, UI/UX, or component library tasks.
triggers:
  - frontend
  - react
  - nextjs
  - tailwind
  - css
  - ui
  - ux
  - component
  - design
agent: universal
---

# Universal Frontend Design

## When to Use

Any task involving user-facing UI: building pages, components, design systems, or visual layouts. This skill prevents generic AI-generated slop by enforcing premium design standards.

## Steps

1. **Start with a design system reference**
   - Check if the project has an existing design system (tokens, components, theme)
   - If not, establish one using a premium free component library as foundation
   - Preferred libraries: Radix UI primitives, shadcn/ui, Tailwind UI

2. **Typography hierarchy**
   - Establish clear H1-H6 scale with consistent line heights
   - Body text: 16px minimum, 1.5-1.6 line height
   - Use a maximum of 2 font families (one for headings, one for body)
   - Ensure WCAG AA contrast ratios (4.5:1 for body, 3:1 for large text)

3. **Color system**
   - Define primary, secondary, neutral, semantic (success, warning, error, info)
   - Use HSL or OKLCH for perceptually uniform color manipulation
   - Provide light and dark variants for each color
   - Never use pure black (#000) or pure white (#fff) as backgrounds

4. **Spacing and layout**
   - Use a consistent spacing scale (4px base: 4, 8, 12, 16, 24, 32, 48, 64, 96)
   - Apply the 8-point grid system for all measurements
   - Use container queries or max-width containers for readable line lengths (60-75ch)

5. **Component patterns**
   - Build accessible components first (keyboard navigation, ARIA labels, focus states)
   - Use composition over configuration
   - Keep components focused: single responsibility principle
   - Document props with JSDoc or TypeScript interfaces

6. **Responsive design**
   - Mobile-first approach
   - Breakpoints: 640px (sm), 768px (md), 1024px (lg), 1280px (xl), 1536px (2xl)
   - Test touch targets: minimum 44x44px for interactive elements

7. **Performance**
   - Optimize images (WebP/AVIF, lazy loading, responsive srcset)
   - Minimize layout shift (CLS) by reserving space for dynamic content
   - Use CSS containment for complex components

## Pitfalls

- **Don't** use default browser styles without reset/normalization
- **Don't** hardcode colors, spacing, or typography values inline
- **Don't** ignore focus states for keyboard navigation
- **Don't** use px units for font sizes (use rem for accessibility)
- **Don't** create components that are too generic or too specific

## Examples

### Good: Composed Button Component
```tsx
// Button.tsx
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";

const buttonVariants = cva(
  "inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive: "bg-destructive text-destructive-foreground hover:bg-destructive/90",
        outline: "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
        ghost: "hover:bg-accent hover:text-accent-foreground",
      },
      size: {
        default: "h-10 px-4 py-2",
        sm: "h-9 rounded-md px-3",
        lg: "h-11 rounded-md px-8",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
);

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {}

export function Button({ className, variant, size, ...props }: ButtonProps) {
  return (
    <button
      className={cn(buttonVariants({ variant, size, className }))}
      {...props}
    />
  );
}
```

### Bad: Inline Styles
```tsx
// Don't do this
<button style={{ backgroundColor: "blue", padding: "10px 20px" }}>
  Click me
</button>
```
