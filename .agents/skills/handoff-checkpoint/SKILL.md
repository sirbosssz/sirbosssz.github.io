---
name: handoff-checkpoint
description: Checkpoints and resumes cross-tool agent work via ~/.handoff/. Use for handoff, checkpoint, resume, session end, switching between Cursor Claude Code and Antigravity.
disable-model-invocation: true
---

# Handoff Checkpoint

## Storage (never in git)

```
~/.handoff/<repo-slug>/
  MILESTONE.md
  PLAN.md
  PROGRESS.md
  HANDOFF.md
```

Resolve slug: `~/.ai-skills/handoff/scripts/handoff.sh paths`

## Checkpoint (after every completed task)

1. `handoff.sh init` if folder missing
2. Append entry to `PROGRESS.md` (timestamp, summary, files)
3. Refresh `HANDOFF.md` sections:
   - Objective, Current status, Completed, Remaining, Blockers, Next action, Resume prompt
4. Promote stable facts to `docs/CONTEXT.md`

Optional helper:

```bash
~/.ai-skills/handoff/scripts/handoff.sh checkpoint "short summary"
```

## Resume (`/handoff` or `/resume-handoff`)

1. Read all four markdown files in handoff dir
2. Print ≤15-line snapshot
3. **Ask confirmation** before executing
4. Continue from `## Next action`
5. Keep checkpointing after each step

## Reading order

HANDOFF.md → AGENTS.md → docs/CONTEXT.md → code

See [reference.md](reference.md) for heading schema and cross-tool notes.
