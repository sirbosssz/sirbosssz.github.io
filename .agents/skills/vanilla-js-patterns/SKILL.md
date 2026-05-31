---
name: vanilla-js-patterns
description: Adds vanilla JavaScript with progressive enhancement — event delegation, feature detection, fail-silent init. Use when adding interactivity, nav toggles, or DOM manipulation without frameworks.
disable-model-invocation: true
---

# Vanilla JS Patterns

## Workflow

1. Confirm HTML/CSS baseline works **without JS**
2. Wrap init in IIFE or use `defer` script
3. Feature-detect before using APIs
4. Use event delegation on stable parents
5. Fail silently — guard with early returns and try/catch
6. Test with JS disabled

## Patterns for this repo

- Nav toggle: `classList.toggle`, update `aria-expanded`
- Close menu on link click
- No global variables — IIFE scope
- Prefer `textContent`, `classList`, `dataset` over `innerHTML`

## Constraints

- No frameworks, no build step
- Scripts in `assets/js/main.js` or page-specific files
- Use `defer` on script tags

See [reference.md](reference.md) for progressive enhancement layers.
