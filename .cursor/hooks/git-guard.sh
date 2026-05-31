#!/usr/bin/env bash
# Gate git commit/push and warn on destructive git commands
set -euo pipefail

input="$(cat)"
command="$(echo "$input" | python3 -c "import sys,json; print(json.load(sys.stdin).get('command',''))" 2>/dev/null || echo "")"

ask() {
  local user_msg="$1"
  local agent_msg="$2"
  python3 -c "import json; print(json.dumps({'permission': 'ask', 'user_message': '''$user_msg''', 'agent_message': '''$agent_msg'''}))"
}

if [[ "$command" =~ git[[:space:]]+commit ]]; then
  ask \
    "This will create a git commit. Project policy requires explicit approval before committing." \
    "Project policy: do not git commit unless the user explicitly asked. Confirm they requested a commit."
  exit 0
fi

if [[ "$command" =~ git[[:space:]]+push ]]; then
  ask \
    "This will push to remote and may trigger GitHub Pages deploy. Project policy requires explicit approval before pushing." \
    "Project policy: do not git push or deploy unless the user explicitly asked. Confirm they requested push/deploy."
  exit 0
fi

if [[ "$command" =~ git[[:space:]]+push[[:space:]]+.*(-f|--force) ]]; then
  ask \
    "This command may force-push. Force-push to main is blocked by project policy." \
    "Project policy: never force-push main on sirbosssz.github.io."
  exit 0
fi

if [[ "$command" =~ git[[:space:]]+reset[[:space:]]+--hard ]]; then
  ask \
    "Hard reset is destructive. Please confirm before proceeding." \
    "git reset --hard detected — confirm with user first."
  exit 0
fi

echo '{ "permission": "allow" }'
exit 0
