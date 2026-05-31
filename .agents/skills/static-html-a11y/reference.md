# Static HTML, a11y & SEO — reference

Sources: [llmbestpractices HTML](https://llmbestpractices.com/frontend/html), [W3C HTML-ARIA](https://www.w3.org/TR/html-aria/)

## Semantic elements

| Element | Use |
|---------|-----|
| `nav` | Primary navigation; `aria-label` if multiple |
| `main` | Primary content; one per page |
| `article` | Standalone content block |
| `section` | Thematic group with heading |
| `header` / `footer` | Page or section chrome |

## Accessibility (WCAG 2.2 AA target)

| Rule | Detail |
|------|--------|
| Headings | One h1; no skipped levels; not for styling |
| ARIA | Only when native HTML insufficient; never duplicate native roles |
| Focus | `:focus-visible` for keyboard users |
| Alt text | Always present; empty for decorative |
| Images | width + height or aspect-ratio for CLS |
| Touch targets | Minimum 24×24 CSS px |
| Language | `lang` on html element |

## SEO meta (index pages)

```html
<meta name="description" content="...">
<meta property="og:title" content="...">
<meta property="og:description" content="...">
<meta property="og:url" content="https://sirbosssz.github.io/">
<meta property="og:image" content="...">
<meta name="twitter:card" content="summary">
```

## Validation tools

- `npx html-validate "**/*.html"`
- Chrome DevTools → Lighthouse → Accessibility
- axe DevTools extension
- Manual: VoiceOver / NVDA spot check

Automated tools catch ~40–60% of issues; manual testing still required.
