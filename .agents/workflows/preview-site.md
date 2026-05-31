# Preview site locally

When the user invokes `/preview`, follow the local preview workflow.

## Steps

1. Load skill `local-preview`
2. Start server: `python3 -m http.server 8080`
3. Open `http://localhost:8080` in browser
4. Run validation: `npx html-validate "**/*.html"`
5. Checklist:
   - [ ] Hero and nav render correctly
   - [ ] Mobile menu toggle works
   - [ ] All external links open
   - [ ] Dark mode (if OS prefers dark)
   - [ ] Lighthouse a11y ≥ 90
6. Report any issues found

Stop the server when done (Ctrl+C).
