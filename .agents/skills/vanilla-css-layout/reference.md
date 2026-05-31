# Vanilla CSS layout — reference

Sources: [Geary responsive 2025+](https://geary.co/responsive-development-era-4/), [HyperWebEnable modern CSS](https://hyperwebenable.com/web-development/modern-responsive-design-css-guide/)

## Layer order

1. **Intrinsic layouts** — auto-fit grids, flex-wrap
2. **Container queries** — component in sidebar/modal/grid
3. **Media queries** — global viewport shifts last

## Patterns

### Fluid typography

```css
--text-hero: clamp(2rem, 1.5rem + 2vw, 2.75rem);
```

Include `rem` in preferred value to respect user zoom.

### Intrinsic grid

```css
grid-template-columns: repeat(auto-fit, minmax(min(300px, 100%), 1fr));
```

### Container query

```css
.card-grid { container-type: inline-size; }
@container (min-width: 400px) { .card { flex-direction: row; } }
```

### Dark mode

```css
@media (prefers-color-scheme: dark) { :root { /* tokens */ } }
```

### Reduced motion

```css
@media (prefers-reduced-motion: reduce) {
  * { transition-duration: 0.01ms !important; }
}
```

## Anti-patterns

- Desktop-first with max-width overrides everywhere
- Fixed px font sizes without fluid scale
- Breakpoints for every component (use intrinsic first)
