#!/usr/bin/env bash
set -euo pipefail

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Starting team AI from: ${PACKAGE_DIR}"

if git -C "$PACKAGE_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  CURRENT_BRANCH="$(git -C "$PACKAGE_DIR" branch --show-current || true)"
  CURRENT_COMMIT="$(git -C "$PACKAGE_DIR" rev-parse --short HEAD 2>/dev/null || true)"
  echo "Package version: ${CURRENT_BRANCH:-detached}@${CURRENT_COMMIT:-uncommitted}"

  if [[ "${TEAM_AI_AUTO_UPDATE:-1}" == "1" ]]; then
    if [[ -n "${TEAM_AI_PINNED_REF:-}" ]]; then
      CURRENT_REF="$(git -C "$PACKAGE_DIR" rev-parse --short HEAD 2>/dev/null || true)"
      REQUIRED_REF="$(git -C "$PACKAGE_DIR" rev-parse --short "$TEAM_AI_PINNED_REF" 2>/dev/null || true)"
      if [[ -n "$REQUIRED_REF" && "$CURRENT_REF" != "$REQUIRED_REF" ]]; then
        echo "Package is not at pinned ref ${TEAM_AI_PINNED_REF}; skipping update."
      fi
    elif [[ "${TEAM_AI_ALLOW_DIRTY_UPDATE:-0}" != "1" ]] && [[ -n "$(git -C "$PACKAGE_DIR" status --porcelain)" ]]; then
      echo "Package checkout has local changes; skipping update."
    elif git -C "$PACKAGE_DIR" rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
      git -C "$PACKAGE_DIR" fetch --quiet --prune || true
      git -C "$PACKAGE_DIR" pull --ff-only --quiet || true
    fi
  else
    echo "Auto-update disabled by TEAM_AI_AUTO_UPDATE=0."
  fi
else
  echo "Package is not inside a git checkout; skipping update check."
fi

echo "Loaded context:"
find "$PACKAGE_DIR/context" -maxdepth 1 -type f -name '*.md' -print | sort

echo "Loaded skills:"
find "$PACKAGE_DIR/skills" -mindepth 2 -maxdepth 2 -type f -name 'SKILL.md' -print | sort
