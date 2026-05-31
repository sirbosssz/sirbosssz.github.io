# Resume from handoff

When the user invokes `/resume-handoff`, follow the handoff skill in **resume** mode.

## Steps

1. Run `~/.ai-skills/handoff/scripts/handoff.sh init` and `handoff.sh paths`
2. Read all files under the printed HANDOFF_DIR:
   - MILESTONE.md, PLAN.md, PROGRESS.md, HANDOFF.md
3. Print a concise **Resume snapshot** (≤15 lines):
   - Objective, status, completed, remaining, blockers, first next action
4. **Ask for confirmation:** "Continue from the next action? (yes / adjust)"
5. Only after **yes**, execute `## Next action` from HANDOFF.md
6. Keep checkpointing after each completed step

Do not skip the confirmation step.

Load skill: `handoff-checkpoint`
