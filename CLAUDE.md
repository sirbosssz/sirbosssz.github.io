# CLAUDE.md

Read [AGENTS.md](AGENTS.md) for full project context, deploy workflow, handoff policy, and repo map.

## Claude Code specifics

- Project skills: `.claude/skills/` (symlink created by `./scripts/install-agent-tooling.sh` → `.agents/skills/`)
- Resume work: `/handoff` — read `~/.handoff/<repo-slug>/`, print snapshot, **confirm with user**, then continue
- Handoff hooks: installed in user `~/.claude/settings.json` via handoff skill

## Conventions (mirror of Cursor rules)

### HTML

- One `<h1>` per page; semantic landmarks (`header`, `nav`, `main`, `footer`)
- ARIA only when native HTML is insufficient
- Every `<img>` has `alt`; set `width`/`height` to prevent CLS
- Meta + Open Graph on index pages

### CSS

- Mobile-first base styles; enhance with `min-width` media queries
- Design tokens in `:root` custom properties
- Intrinsic grids (`auto-fit` + `minmax`); container queries when component context matters
- Support `prefers-color-scheme` and `prefers-reduced-motion`
- Plain CSS only — no preprocessors

### JavaScript

- Progressive enhancement — HTML/CSS work without JS
- Feature detection, not UA sniffing
- Event delegation; prefer `textContent`/`classList` over `innerHTML`
- IIFE or deferred scripts; no frameworks

### GitHub Pages

- Push to `main` triggers deploy; never force-push
- Site root is the artifact — `index.html` must exist at repo root
- `.nojekyll` disables Jekyll

## Checkpoint policy

After each completed task, update handoff files and mirror stable decisions into `docs/CONTEXT.md`.
