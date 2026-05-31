# Agent tools operator guide

How to work on this repo across **Cursor**, **Claude Code**, and **Antigravity**.

## First-time setup

```bash
cd /path/to/sirbosssz.github.io
./scripts/install-agent-tooling.sh
```

This script:

1. Symlinks `.agents/skills/` → `.cursor/skills/` and `.claude/skills/`
2. Runs handoff install (`~/.ai-skills/handoff/scripts/install.sh`)
3. Initializes handoff state for this repo

Find your handoff slug:

```bash
~/.ai-skills/handoff/scripts/handoff.sh paths
```

## Tool mapping

| Concern | Cursor | Claude Code | Antigravity |
|---------|--------|-------------|-------------|
| Entry doc | `AGENTS.md` (auto) | `CLAUDE.md` → AGENTS.md | `.agents/AGENTS.md` |
| Style prefs | `.cursor/rules/*.mdc` | CLAUDE.md sections | `GEMINI.md` |
| Skills | `.cursor/skills/` (symlink) | `.claude/skills/` (symlink) | `.agents/skills/` (native) |
| Resume | `/handoff` | `/handoff` | `/resume-handoff` |
| Hooks | `.cursor/hooks.json` + user handoff hooks | user `~/.claude/settings.json` | workflows only |

## Cursor

- Rules auto-load from `.cursor/rules/`
- Project hooks: session start injects handoff context; git-guard warns on force-push
- User handoff hooks on `stop` / `preCompact` (via handoff install)

## Claude Code

- Loads `CLAUDE.md` at session start
- Skills from `.claude/skills/` (symlink to canonical)
- `/handoff` for resume with confirmation gate

## Antigravity

- Loads `.agents/AGENTS.md` (symlink to root `AGENTS.md`)
- Style from `GEMINI.md`
- Workflows in `.agents/workflows/`:

| Workflow | Command | Purpose |
|----------|---------|---------|
| `deploy.md` | `/deploy` | Validate → push → verify Actions |
| `resume-handoff.md` | `/resume-handoff` | Read handoff, confirm, continue |
| `preview-site.md` | `/preview` | Local server + checklist |

## Handoff protocol

1. **After each task:** append `PROGRESS.md`, refresh `HANDOFF.md` sections
2. **On resume:** read all files in `~/.handoff/<repo-slug>/`, print ≤15-line snapshot, ask confirmation
3. **Stable facts:** promote to `docs/CONTEXT.md`

## Verification checklist

- [ ] `./scripts/install-agent-tooling.sh` succeeds
- [ ] `.cursor/skills` and `.claude/skills` point to `.agents/skills`
- [ ] `python3 -m http.server 8080` serves index.html
- [ ] `npx html-validate "**/*.html"` passes
- [ ] Push to `main` deploys to https://sirbosssz.github.io
- [ ] Cross-tool: checkpoint in one agent, `/handoff` in another
