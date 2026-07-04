#!/usr/bin/env bash
# Sync docs/ and templates/ into skill/ for installable Cursor Skill package.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILL_DIR="$ROOT/skill"
DEV_SKILL="$ROOT/.cursor/skills/project-intake"

echo "Syncing reference docs..."
rm -rf "$SKILL_DIR/reference"
mkdir -p "$SKILL_DIR/reference"
cp -R "$ROOT/docs/." "$SKILL_DIR/reference/"

echo "Syncing templates..."
rm -rf "$SKILL_DIR/templates"
cp -R "$ROOT/templates" "$SKILL_DIR/templates"

echo "Syncing to local .cursor/skills/project-intake..."
mkdir -p "$DEV_SKILL"
cp "$SKILL_DIR/SKILL.md" "$DEV_SKILL/SKILL.md"
rm -rf "$DEV_SKILL/reference" "$DEV_SKILL/templates"
cp -R "$SKILL_DIR/reference" "$DEV_SKILL/reference"
cp -R "$SKILL_DIR/templates" "$DEV_SKILL/templates"

echo "Done. Skill package: $SKILL_DIR"
