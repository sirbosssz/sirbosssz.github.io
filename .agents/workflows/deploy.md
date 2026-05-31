# Deploy to GitHub Pages

When the user invokes `/deploy` **or explicitly asks to deploy/publish/push**, follow this workflow using `.agents/skills/` and [AGENTS.md](../../AGENTS.md).

**If the user did not ask to deploy, do not commit or push.** Offer to deploy only after they confirm.

## Steps

1. Load skill `github-pages-deploy` and `local-preview`
2. Run pre-deploy checklist:
   - `test -f index.html`
   - `npx html-validate "**/*.html"`
3. If validation fails, fix errors before proceeding
4. Guide user to commit and push to `main` (do not force-push)
5. Monitor: `gh run list --workflow pages.yml --limit 3`
6. Verify live URL: `https://sirbosssz.github.io`
7. Update `docs/CONTEXT.md` deploy status
8. Checkpoint handoff per `handoff-checkpoint` skill

## One-time reminder

GitHub **Settings → Pages → GitHub Actions** must be selected as source.
