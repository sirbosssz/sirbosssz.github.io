---
name: vanilla-css-layout
description: Implements responsive layouts with vanilla CSS — mobile-first, custom properties, intrinsic grids, container queries. Use when styling pages, adding breakpoints, or defining design tokens.
disable-model-invocation: true
---

# Vanilla CSS Layout

## Workflow

1. Define tokens in `:root` (colors, spacing, type scale)
2. Write mobile-first base styles (no media queries)
3. Use intrinsic grid: `repeat(auto-fit, minmax(min(300px, 100%), 1fr))`
4. Use flexbox for one-dimensional flows
5. Add container queries when component context matters (not viewport)
6. Add `min-width` media queries only for global layout shifts
7. Support `prefers-color-scheme` and `prefers-reduced-motion`

## Token pattern

```css
:root {
  --color-accent: #6b4ce6;
  --space-md: 1rem;
  --text-base: clamp(1rem, 0.95rem + 0.25vw, 1.125rem);
}
```

## Constraints

- Plain CSS files only — no preprocessors
- Relative units (`rem`, `%`, `clamp`) over fixed px for type/spacing
- No inline styles in HTML

See [reference.md](reference.md) for layout layer order and patterns.
