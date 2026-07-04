#!/usr/bin/env bash
# Install project-intake skill to ~/.cursor/skills/ (or CURSOR_SKILLS_DIR).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${CURSOR_SKILLS_DIR:-$HOME/.cursor/skills}/project-intake"

"$ROOT/scripts/sync-skill.sh"

echo "Installing to $TARGET ..."
rm -rf "$TARGET"
mkdir -p "$TARGET"
cp "$ROOT/skill/SKILL.md" "$TARGET/SKILL.md"
cp -R "$ROOT/skill/reference" "$TARGET/reference"
cp -R "$ROOT/skill/templates" "$TARGET/templates"

echo "Installed project-intake skill to: $TARGET"
echo "Restart Cursor or start a new agent session to pick up the skill."
