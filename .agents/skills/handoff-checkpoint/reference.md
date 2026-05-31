# Handoff checkpoint — reference

Sources: `~/.ai-skills/handoff/SKILL.md`, [Augment session-end spec](https://www.augmentcode.com/guides/session-end-spec-update-ai-agents)

## HANDOFF.md headings (exact)

```markdown
## Objective
## Current status
## Completed
## Remaining
## Blockers
## Next action
## Resume prompt
```

## Hot vs durable memory

| Layer | Location | In git? |
|-------|----------|---------|
| Handoff (hot) | `~/.handoff/<slug>/` | No |
| Context (durable) | `docs/CONTEXT.md` | Yes |

## Rules

- Keep handoff compact — fits in context window
- Don't duplicate specs — reference paths
- Resume prompt = copy-paste for next agent
- Cross-tool: checkpoint in Cursor → resume in Claude via `/handoff`

## Hook integration

| Tool | Events | Script |
|------|--------|--------|
| Cursor | preCompact, stop | cursor-checkpoint.sh |
| Claude | PreCompact, Stop | claude-checkpoint.sh |

Install: `~/.ai-skills/handoff/scripts/install.sh`

## Cross-tool test

1. Agent A completes task; verify PROGRESS + HANDOFF updated
2. Agent B runs `/handoff`; confirms snapshot
3. Agent B executes Next action
4. No handoff files in git status
