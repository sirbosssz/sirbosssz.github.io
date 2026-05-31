# Project context (durable memory)

Agents: update this file when facts stabilize. Do not store session state here — use `~/.handoff/<repo-slug>/` for that.

Last updated: 2026-05-31

## Owner

- **Name:** Pattadon Baongern
- **Roles:** Project Manager, Technical Project Manager, Senior/Lead Developer, Game Producer
- **GitHub:** [sirbosssz](https://github.com/sirbosssz)
- **LinkedIn:** [pattadonb](https://www.linkedin.com/in/pattadonb/)
- **Portfolio (Notion):** [pattadonb.notion.site](https://pattadonb.notion.site/338e62d9e6df41cd825ce7da808a0531?v=91d01a699d4a48268602da72de4b1314&pvs=74)

## Site

- **URL:** https://sirbosssz.github.io
- **Type:** GitHub Pages user site (repo root on `main`)
- **Stack:** Vanilla HTML + CSS + JS, no build step
- **Deploy:** Push to `main` → `.github/workflows/pages.yml` → GitHub Actions Pages
- **Status:** Initial scaffold deployed via agent setup (2026-05-31)

## Design

- **Current:** Minimal portfolio — cream background, violet accent (`#6b4ce6`), system fonts
- **Dark mode:** via `prefers-color-scheme`
- **Future concept (Phase 2+):** Game-inventory / character-sheet UI with modal sections (About, Experience, Portfolio, Skills) — documented in prior Claude sessions, not yet implemented

## Decisions

| Date | Decision |
|------|----------|
| 2026-05-31 | Vanilla static site over Nuxt (`origin/setup` branch unused) |
| 2026-05-31 | English only for now; no `th/` locale yet |
| 2026-05-31 | Multi-tool agent layer: Cursor + Claude Code + Antigravity |
| 2026-05-31 | Canonical skills in `.agents/skills/`; handoff via `~/.handoff/` |

## Links to verify

- [ ] https://sirbosssz.github.io loads after first deploy
- [ ] Notion portfolio link returns 200
- [ ] LinkedIn link returns 200
- [ ] GitHub profile link returns 200
