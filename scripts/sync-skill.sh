#!/usr/bin/env bash
# Sync docs/ and templates/ into skill/ installable package.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILL_DIR="$ROOT/skill"

echo "Syncing reference docs..."
rm -rf "$SKILL_DIR/reference"
mkdir -p "$SKILL_DIR/reference"
cp -R "$ROOT/docs/." "$SKILL_DIR/reference/"

echo "Syncing templates..."
rm -rf "$SKILL_DIR/templates"
cp -R "$ROOT/templates" "$SKILL_DIR/templates"

echo "Done. Skill package: $SKILL_DIR"
