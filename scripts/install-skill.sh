#!/usr/bin/env bash
# Install project-intake skill to the agent's skills directory.
# Usage: ./install-skill.sh [target-dir]
#   target-dir defaults to $AGENT_SKILLS_DIR/project-intake
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ "${1:-}" != "" ]; then
  TARGET="$1"
else
  if [ -z "${AGENT_SKILLS_DIR:-}" ]; then
    echo "Error: set AGENT_SKILLS_DIR or pass install path as first argument." >&2
    echo "Example: AGENT_SKILLS_DIR=\$HOME/skills ./scripts/install-skill.sh" >&2
    echo "Example: ./scripts/install-skill.sh /path/to/skills/project-intake" >&2
    exit 1
  fi
  TARGET="$AGENT_SKILLS_DIR/project-intake"
fi

"$ROOT/scripts/sync-skill.sh"

echo "Installing to $TARGET ..."
rm -rf "$TARGET"
mkdir -p "$TARGET"
cp "$ROOT/skill/SKILL.md" "$TARGET/SKILL.md"
cp "$ROOT/skill/INSTALL.md" "$TARGET/INSTALL.md"
cp -R "$ROOT/skill/reference" "$TARGET/reference"
cp -R "$ROOT/skill/templates" "$TARGET/templates"

echo "Installed project-intake skill to: $TARGET"
echo "Start a new agent session so the skill is loaded."
