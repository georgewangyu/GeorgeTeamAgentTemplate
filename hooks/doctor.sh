#!/usr/bin/env bash
set -euo pipefail

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILURES=0

check() {
  local label="$1"
  shift
  if "$@"; then
    printf 'ok - %s\n' "$label"
  else
    printf 'not ok - %s\n' "$label"
    FAILURES=$((FAILURES + 1))
  fi
}

check "node is available" command -v node
check "git is available" command -v git
check "agent spec JSON and package files validate" node "$PACKAGE_DIR/scripts/validate.js"

echo "Context files:"
find "$PACKAGE_DIR/context" -maxdepth 1 -type f -name '*.md' -print | sort

echo "Skill files:"
find "$PACKAGE_DIR/skills" -mindepth 2 -maxdepth 2 -type f -name 'SKILL.md' -print | sort

if [[ "$FAILURES" -gt 0 ]]; then
  echo "Doctor found ${FAILURES} failure(s)." >&2
  exit 1
fi

echo "Doctor checks passed."
