# GEMINI.md — Antigravity preferences

Style and context preferences for this project. **Behavior rules and constraints** live in [AGENTS.md](AGENTS.md).

## Coding style

- Vanilla HTML, CSS, and JavaScript only
- Semantic HTML5 elements over generic `<div>` wrappers
- Mobile-first CSS with custom properties for tokens
- Progressive enhancement — JS enhances, never replaces core functionality
- English UI copy

## Design direction

Current phase: clean minimal portfolio (cream/violet accent tokens in `assets/css/main.css`).

Future option (not yet built): game-inventory / character-sheet UI aesthetic — see [docs/CONTEXT.md](docs/CONTEXT.md) for notes.

## Typography and spacing

- System font stack for performance
- Fluid type via `clamp()` with `rem` in preferred values
- Generous whitespace; max content width ~42rem

## File organization

- Styles: `assets/css/main.css`
- Scripts: `assets/js/main.js`
- Images: `assets/img/`

## Workflows

Antigravity slash commands in `.agents/workflows/`:

- `/deploy` — validate and deploy guidance
- `/resume-handoff` — continue from handoff state
- `/preview` — local preview checklist

Skills: `.agents/skills/` (canonical)
