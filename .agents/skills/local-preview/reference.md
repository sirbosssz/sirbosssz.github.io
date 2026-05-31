# Local preview — reference

## Preview servers

| Tool | Command | Notes |
|------|---------|-------|
| Python (default) | `python3 -m http.server 8080` | Zero deps |
| npx serve | `npx serve .` | Alternative |

**Security:** bind localhost only; never expose dev server publicly.

## HTML validation

```bash
npx html-validate "**/*.html"
npx w3c-validate-html --target . --errors-only  # optional, W3C vnu
npx markuplint "**/*.html"  # optional, deeper lint
```

## Lighthouse

Chrome DevTools → Lighthouse tab → run on `http://localhost:8080`

Categories: Performance, Accessibility, Best Practices, SEO

## Link checking

```bash
curl -sI -o /dev/null -w "%{http_code}" https://www.linkedin.com/in/pattadonb/
```

Or use lychee in CI if added later.

## Multi-page

When adding pages, create `404.html` and test unmatched paths locally.
