---
name: github-pages-deploy
description: Deploys and troubleshoots GitHub Pages for this vanilla static site. Use when deploying, publishing, configuring pages.yml, verifying Actions runs, or fixing GitHub Pages 404 errors.
disable-model-invocation: true
---

# GitHub Pages Deploy

## Permission gate

**Do not commit, push, or deploy unless the user explicitly asks.**

Only run this skill's deploy steps when the user requests deploy, publish, push to main, or commit and deploy. If they only asked for code changes, stop after edits and local validation.

## Pre-deploy checklist

- [ ] `index.html` exists at repo root
- [ ] `.nojekyll` present
- [ ] `404.html` present (optional but recommended)
- [ ] `npx html-validate "**/*.html"` passes locally
- [ ] GitHub **Settings → Pages → GitHub Actions** is selected as source

## Deploy steps

1. Commit changes on `main`
2. Push: `git push origin main`
3. Monitor: `gh run list --workflow pages.yml --limit 3`
4. Watch run: `gh run watch`
5. Verify live: `curl -sI https://sirbosssz.github.io | head -5`
6. Update `docs/CONTEXT.md` deploy status if changed

## Workflow structure

- **build job:** checkout → html-validate → verify index.html → upload-pages-artifact
- **deploy job:** deploy-pages@v4 with `pages: write` + `id-token: write`
- **concurrency:** `group: pages`, `cancel-in-progress: false`

## Safety

- **No commit/push/deploy without explicit user request**
- Never `git push --force` to `main`
- User site (`sirbosssz.github.io`) — no `/repo/` base path needed
- Artifact path is `.` (repo root)

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Workflow never runs | Enable Pages with GitHub Actions source first |
| Deploy fails OIDC | Ensure deploy job has `id-token: write` |
| 404 on root | Missing `index.html` at artifact root |
| Jekyll breaks assets | Add `.nojekyll` |

See [reference.md](reference.md) for full best-practices table.
