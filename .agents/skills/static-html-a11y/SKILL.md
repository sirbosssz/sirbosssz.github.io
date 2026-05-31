---
name: static-html-a11y
description: Audits and improves HTML semantics, accessibility (WCAG 2.2 AA), and SEO for static pages. Use when editing HTML, adding meta tags, fixing landmarks, alt text, or running html-validate.
disable-model-invocation: true
---

# Static HTML, Accessibility & SEO

## Audit workflow

1. **Structure:** one `<h1>`, logical heading order, semantic landmarks
2. **Landmarks:** `<header>`, `<nav>`, `<main>`, `<footer>` — one `<main>` per page
3. **Images:** every `<img>` has `alt`; decorative = `alt=""`; set width/height
4. **Meta:** title, description, Open Graph, Twitter Card
5. **Focus:** `:focus-visible` styles; touch targets ≥ 24×24px
6. **Validate:** `npx html-validate "**/*.html"`

## Rules

- Native HTML first; ARIA only when insufficient
- Never duplicate visible text in `aria-label`
- `lang="en"` on `<html>`
- Optional JSON-LD for Person/WebSite on index

## Checklist

- [ ] Single h1 matches page topic
- [ ] Skip link to `#main`
- [ ] All links have descriptive text
- [ ] Icon buttons have `aria-label`
- [ ] No skipped heading levels

See [reference.md](reference.md) for WCAG and SEO details.
