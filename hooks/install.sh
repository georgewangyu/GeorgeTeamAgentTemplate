#!/usr/bin/env bash
set -euo pipefail

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ALIAS_NAME="${TEAM_AI_ALIAS:-ai}"
SHELL_RC="${TEAM_AI_SHELL_RC:-$HOME/.zshrc}"
AGENT_COMMAND="${TEAM_AI_COMMAND:-codex}"
INSTALL_DIR="${TEAM_AI_INSTALL_DIR:-$HOME/.team-ai}"
DRY_RUN=0

usage() {
  cat <<USAGE
Usage: ./hooks/install.sh [--check] [--dry-run]

Environment:
  TEAM_AI_ALIAS       Alias name to install. Default: ai
  TEAM_AI_COMMAND     Agent command to execute. Default: codex
  TEAM_AI_SHELL_RC    Shell rc file to update. Default: \$HOME/.zshrc
  TEAM_AI_INSTALL_DIR Launcher directory. Default: \$HOME/.team-ai
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      echo "GeorgeTeamAgentTemplate install hook is present."
      exit 0
      ;;
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

if [[ "$DRY_RUN" == "1" ]]; then
  echo "Would create launcher: ${INSTALL_DIR}/launcher"
  echo "Would add alias '${ALIAS_NAME}' to ${SHELL_RC}"
  exit 0
fi

mkdir -p "$INSTALL_DIR"
cat > "$INSTALL_DIR/launcher" <<EOF
#!/usr/bin/env bash
set -euo pipefail
cd "$PACKAGE_DIR"
./hooks/agent-start.sh
exec $AGENT_COMMAND
EOF
chmod +x "$INSTALL_DIR/launcher"

START_MARKER="# >>> GeorgeTeamAgentTemplate ${ALIAS_NAME} >>>"
END_MARKER="# <<< GeorgeTeamAgentTemplate ${ALIAS_NAME} <<<"

if grep -qF "$START_MARKER" "$SHELL_RC" 2>/dev/null; then
  echo "Managed alias block for '${ALIAS_NAME}' already exists in ${SHELL_RC}."
elif grep -qF "alias ${ALIAS_NAME}=" "$SHELL_RC" 2>/dev/null; then
  echo "Alias '${ALIAS_NAME}' already exists in ${SHELL_RC}; leaving it unchanged."
else
  {
    printf '\n%s\n' "$START_MARKER"
    printf 'alias %s="%s/launcher"\n' "$ALIAS_NAME" "$INSTALL_DIR"
    printf '%s\n' "$END_MARKER"
  } >> "$SHELL_RC"
  echo "Added alias '${ALIAS_NAME}' to ${SHELL_RC}."
fi

echo "Installed ${ALIAS_NAME}. Restart your shell or run: source ${SHELL_RC}"
