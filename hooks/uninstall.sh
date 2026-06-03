#!/usr/bin/env bash
set -euo pipefail

ALIAS_NAME="${TEAM_AI_ALIAS:-ai}"
SHELL_RC="${TEAM_AI_SHELL_RC:-$HOME/.zshrc}"
INSTALL_DIR="${TEAM_AI_INSTALL_DIR:-$HOME/.team-ai}"
DRY_RUN=0

usage() {
  cat <<USAGE
Usage: ./hooks/uninstall.sh [--dry-run]

Removes the managed launcher and the shell alias block created by install.sh.
Existing user-owned aliases are left unchanged.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

START_MARKER="# >>> GeorgeTeamAgentTemplate ${ALIAS_NAME} >>>"
END_MARKER="# <<< GeorgeTeamAgentTemplate ${ALIAS_NAME} <<<"

if [[ "$DRY_RUN" == "1" ]]; then
  echo "Would remove launcher: ${INSTALL_DIR}/launcher"
  echo "Would remove managed alias block from ${SHELL_RC}"
  exit 0
fi

rm -f "$INSTALL_DIR/launcher"

if [[ -f "$SHELL_RC" ]] && grep -qF "$START_MARKER" "$SHELL_RC"; then
  TMP_FILE="$(mktemp)"
  awk -v start="$START_MARKER" -v end="$END_MARKER" '
    $0 == start { skip = 1; next }
    $0 == end { skip = 0; next }
    skip != 1 { print }
  ' "$SHELL_RC" > "$TMP_FILE"
  mv "$TMP_FILE" "$SHELL_RC"
  echo "Removed managed alias block for '${ALIAS_NAME}' from ${SHELL_RC}."
else
  echo "No managed alias block for '${ALIAS_NAME}' found in ${SHELL_RC}."
fi

echo "Uninstalled launcher from ${INSTALL_DIR}."
