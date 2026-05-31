#!/usr/bin/env bash
# Inject handoff context at session start if HANDOFF.md exists
set -euo pipefail

input="$(cat)"
repo_root="$(pwd)"
handoff_script="$HOME/.ai-skills/handoff/scripts/handoff.sh"

if [[ ! -x "$handoff_script" ]]; then
  exit 0
fi

slug="$("$handoff_script" slug 2>/dev/null || echo "")"
if [[ -z "$slug" ]]; then
  exit 0
fi

handoff_dir="$HOME/.handoff/$slug"
handoff_file="$handoff_dir/HANDOFF.md"

if [[ ! -f "$handoff_file" ]]; then
  exit 0
fi

summary="$(python3 - <<'PY' "$handoff_file"
import sys
from pathlib import Path
text = Path(sys.argv[1]).read_text()
sections = {}
current = None
for line in text.splitlines():
    if line.startswith("## "):
        current = line[3:].strip()
        sections[current] = []
    elif current and line.strip():
        sections[current].append(line.strip())
def grab(name, limit=3):
    lines = sections.get(name, [])
    return " ".join(lines[:limit]) if lines else "(empty)"
print(f"Handoff available at {sys.argv[1]}")
print(f"Objective: {grab('Objective', 2)}")
print(f"Status: {grab('Current status', 2)}")
print(f"Next action: {grab('Next action', 2)}")
print("Use /handoff to resume with confirmation.")
PY
)"

python3 -c "import json; print(json.dumps({'additional_context': '''$summary'''}))" 2>/dev/null || exit 0
exit 0
