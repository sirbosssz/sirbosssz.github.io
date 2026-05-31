---
name: local-preview
description: Previews and validates the static site locally — python http.server, html-validate, Lighthouse. Use when testing changes before deploy or debugging layout issues.
disable-model-invocation: true
---

# Local Preview & Validation

## Quick start

```bash
python3 -m http.server 8080
# Open http://localhost:8080
```

## Validation workflow

1. Start local server (localhost only)
2. `npx html-validate "**/*.html"`
3. Chrome DevTools → Lighthouse (Performance, A11y, SEO)
4. Check external links (Notion, LinkedIn, GitHub)
5. Test mobile viewport in DevTools

## Targets

| Metric | Target |
|--------|--------|
| html-validate | 0 errors |
| Lighthouse a11y | ≥ 90 |
| CLS | < 0.1 |
| LCP | < 2.5s (static site should easily pass) |

## CI parity

Local command must match `.github/workflows/pages.yml`:

```bash
npx html-validate "**/*.html"
```

See [reference.md](reference.md) for additional tools.
