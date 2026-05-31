# GitHub Pages deploy — reference

Sources: [llmbestpractices GitHub Pages](https://llmbestpractices.com/ops/github-pages), [upload-pages-artifact](https://github.com/actions/upload-pages-artifact)

## Best practices

| Rule | Why |
|------|-----|
| GitHub Actions source, not branch deploy | Full control; no opaque Jekyll |
| Split build + deploy jobs | Isolated deploy environment |
| `contents: read` at workflow level | Least privilege |
| Deploy job: `pages: write` + `id-token: write` | OIDC required for deploy-pages@v4 |
| `concurrency: cancel-in-progress: false` | Avoid half-published site |
| `upload-pages-artifact@v3` | Produces valid tarball |
| Keep artifact under 1 GB | Pages limit |
| `.nojekyll` at root | Disable Jekyll |
| User site: no base path prefix | Project pages need `/repo/` — not this repo |
| `index.html` at artifact root | #1 cause of 404 |
| `404.html` for unmatched paths | Pages serves automatically |
| Enable Pages before first push | Creates github-pages environment |
| Verify with `gh run list` | Safe agent loop |
| CNAME must match Settings exactly | Custom domain only |

## Permissions block

```yaml
permissions:
  contents: read
  pages: write
  id-token: write
```

## Verify commands

```bash
gh run list --workflow pages.yml --limit 5
gh run view <run-id> --log-failed
curl -sI https://sirbosssz.github.io
```
