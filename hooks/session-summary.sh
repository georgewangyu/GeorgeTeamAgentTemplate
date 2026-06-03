#!/usr/bin/env bash
set -euo pipefail

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PERSON="${TEAM_AI_PERSON:-example-user}"
DATE_UTC="$(date -u '+%Y-%m-%d')"
YEAR_UTC="$(date -u '+%Y')"
MONTH_UTC="$(date -u '+%m')"
MEMORY_DIR="${TEAM_AI_MEMORY_DIR:-$PACKAGE_DIR/memory}"
JOURNAL_DIR="$MEMORY_DIR/journals/$YEAR_UTC/$MONTH_UTC"
INDEX_FILE="$MEMORY_DIR/index.md"

mkdir -p "$JOURNAL_DIR"
OUT="$JOURNAL_DIR/${DATE_UTC}_${PERSON}.md"

if [[ ! -f "$OUT" ]]; then
  cat > "$OUT" <<EOF
---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/memory/journals/${YEAR_UTC}/${MONTH_UTC}/${DATE_UTC}_${PERSON}"
doc_type: "memory_journal"
doc_status: "active"
title: "Team AI Journal - ${DATE_UTC} - ${PERSON}"
description: "Incremental team AI memory journal for ${PERSON} on ${DATE_UTC}."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai-memory"
  - "type:memory_journal"
---
# Team AI Journal - ${DATE_UTC} - ${PERSON}

## Transaction Log

EOF
fi

STAMP="$(date -u '+%H:%M:%SZ')"
cat >> "$OUT" <<EOF
### ${STAMP}

- Changed:
- Decision:
- Verification:
- Blocker:
- Memory candidate:

EOF

if [[ -f "$INDEX_FILE" ]]; then
  printf '\n- `%s` — appended journal entry for `%s`.\n' "$DATE_UTC" "$PERSON" >> "$INDEX_FILE"
fi

echo "Appended incremental journal entry: $OUT"
