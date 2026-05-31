#!/usr/bin/env bash
# Install cross-tool agent symlinks and handoff for sirbosssz.github.io
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "Installing agent tooling for $ROOT"

mkdir -p .cursor .claude

if [[ -d .cursor/skills && ! -L .cursor/skills ]]; then
  echo "WARN: .cursor/skills exists and is not a symlink — skipping" >&2
else
  ln -sfn ../.agents/skills .cursor/skills
  echo "Linked .cursor/skills -> .agents/skills"
fi

if [[ -d .claude/skills && ! -L .claude/skills ]]; then
  echo "WARN: .claude/skills exists and is not a symlink — skipping" >&2
else
  ln -sfn ../.agents/skills .claude/skills
  echo "Linked .claude/skills -> .agents/skills"
fi

if [[ ! -L .agents/AGENTS.md ]]; then
  ln -sfn ../AGENTS.md .agents/AGENTS.md
  echo "Linked .agents/AGENTS.md -> AGENTS.md"
fi

chmod +x .cursor/hooks/*.sh 2>/dev/null || true
chmod +x scripts/install-agent-tooling.sh

HANDOFF_INSTALL="$HOME/.ai-skills/handoff/scripts/install.sh"
HANDOFF_INIT="$HOME/.ai-skills/handoff/scripts/handoff.sh"

if [[ -x "$HANDOFF_INSTALL" ]]; then
  "$HANDOFF_INSTALL"
else
  echo "WARN: handoff install not found at $HANDOFF_INSTALL" >&2
fi

if [[ -x "$HANDOFF_INIT" ]]; then
  "$HANDOFF_INIT" init
  echo ""
  echo "Handoff paths:"
  "$HANDOFF_INIT" paths
else
  echo "WARN: handoff init not found at $HANDOFF_INIT" >&2
fi

echo ""
echo "Done. See docs/AGENT-TOOLS.md for multi-tool usage."
