#!/usr/bin/env bash
# Warn on destructive git commands
set -euo pipefail

input="$(cat)"
command="$(echo "$input" | python3 -c "import sys,json; print(json.load(sys.stdin).get('command',''))" 2>/dev/null || echo "")"

if [[ "$command" =~ git[[:space:]]+push[[:space:]]+.*(-f|--force) ]]; then
  cat <<'JSON'
{
  "permission": "ask",
  "user_message": "This command may force-push. Force-push to main is blocked by project policy.",
  "agent_message": "Project policy: never force-push main on sirbosssz.github.io."
}
JSON
  exit 0
fi

if [[ "$command" =~ git[[:space:]]+reset[[:space:]]+--hard ]]; then
  cat <<'JSON'
{
  "permission": "ask",
  "user_message": "Hard reset is destructive. Please confirm before proceeding.",
  "agent_message": "git reset --hard detected — confirm with user first."
}
JSON
  exit 0
fi

echo '{ "permission": "allow" }'
exit 0
