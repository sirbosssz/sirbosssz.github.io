# AGENTS.md — sirbosssz.github.io

Canonical instructions for AI agents working in this repository (Cursor, Claude Code, Antigravity, and others).

## Project identity

- **Site:** [https://sirbosssz.github.io](https://sirbosssz.github.io) — GitHub Pages **user site** (served from repo root on `main`)
- **Stack:** Vanilla HTML + CSS + JS — no build step, no npm, no frameworks
- **Language:** English UI copy for now
- **Owner:** Pattadon Baongern — PM / Technical PM / Senior Developer / Game Producer

## Repo map

| Path | Purpose |
|------|---------|
| `index.html` | Live portfolio landing page |
| `404.html` | Custom not-found page |
| `assets/css/main.css` | Styles and design tokens |
| `assets/js/main.js` | Progressive enhancement (nav toggle) |
| `assets/img/` | Site images |
| `README.md` | GitHub **profile** readme — not the live site |
| `portfolio_image/` | Legacy image path used by README |
| `.agents/skills/` | Canonical agent skills (Agent Skills standard) |
| `.agents/workflows/` | Antigravity slash-command workflows |
| `.cursor/rules/` | Cursor-specific scoped rules |
| `docs/CONTEXT.md` | Durable project memory (in git) |
| `docs/AGENT-TOOLS.md` | Multi-tool operator guide |

## Dev workflow

1. Edit HTML/CSS/JS locally
2. Preview: `python3 -m http.server 8080` then open `http://localhost:8080`
3. Validate: `npx html-validate "**/*.html"`
4. No npm install required for the site itself

## Deploy workflow

Deploy happens automatically **only after** changes are pushed to `main` (via GitHub Actions).

**Agents must not deploy unless the user explicitly asks** (e.g. "commit and push", "deploy", "publish to GitHub Pages").

When the user does ask to deploy:

1. Commit and push to `main` (only if user also asked to commit, or deploy implies both)
2. GitHub Actions (`.github/workflows/pages.yml`) validates HTML and deploys via `deploy-pages@v4`
3. Verify: `gh run list --workflow pages.yml` and check `https://sirbosssz.github.io`
4. **One-time setup:** GitHub repo **Settings → Pages → Build and deployment → GitHub Actions**

**Never** force-push `main`. Do not commit secrets (`.env`, tokens, credentials).

## Git and deploy policy (mandatory)

| Action | Rule |
|--------|------|
| `git commit` | **Do not run** unless the user explicitly asks you to commit |
| `git push` | **Do not run** unless the user explicitly asks you to push or deploy |
| Deploy (push → Actions → live site) | **Do not trigger** unless the user explicitly asks to deploy or publish |
| `git add` / staging | OK when preparing work, but stop before commit unless asked |
| Local preview / validate | OK without asking — `python3 -m http.server`, `html-validate` |

If unclear whether the user wants a commit or deploy, **ask first**. Finishing edits is not permission to commit or push.

## Multi-tool setup

See [docs/AGENT-TOOLS.md](docs/AGENT-TOOLS.md) for Cursor, Claude Code, and Antigravity adapters.

After clone, run:

```bash
./scripts/install-agent-tooling.sh
```

## Skills

Canonical skills live in `.agents/skills/`. Invoke by name or let the agent auto-match from descriptions:

| Skill | Use when |
|-------|----------|
| `github-pages-deploy` | Deploying, CI, GitHub Pages |
| `static-html-a11y` | HTML structure, accessibility, SEO |
| `vanilla-css-layout` | CSS layout, responsive design |
| `vanilla-js-patterns` | JavaScript interactivity |
| `portfolio-content` | Bio, projects, case studies |
| `local-preview` | Local server, validation, Lighthouse |
| `handoff-checkpoint` | Session continuity, resume work |

## Handoff continuity

Cross-tool session state lives **outside git** at `~/.handoff/<repo-slug>/`.

- **After every completed task:** update `PROGRESS.md` and `HANDOFF.md` per the handoff skill
- **Resume:** `/handoff` (Cursor / Claude Code) or `/resume-handoff` (Antigravity)
- **Init:** `~/.ai-skills/handoff/scripts/handoff.sh init && handoff.sh paths`
- **Promote stable facts** to [docs/CONTEXT.md](docs/CONTEXT.md) — do not duplicate specs in handoff files

Reading order on resume: `HANDOFF.md` → this file → `docs/CONTEXT.md` → code.

## Safety

- **No commit unless asked** — do not run `git commit` unless the user explicitly requests it
- **No push/deploy unless asked** — do not run `git push` or trigger GitHub Pages deploy unless the user explicitly requests deploy/publish/push
- Ask before destructive git operations (`reset --hard`, force push)
- Do not commit handoff state or secrets
- Keep changes focused — match existing vanilla patterns
- Update `docs/CONTEXT.md` when deploy status or design decisions change

## Memory

Durable facts: [docs/CONTEXT.md](docs/CONTEXT.md)

Ephemeral session state: `~/.handoff/<repo-slug>/` (MILESTONE, PLAN, PROGRESS, HANDOFF)
