---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/memory/index"
doc_type: "memory_index"
doc_status: "active"
title: "Team AI Memory Index"
description: "Transaction log and map for team AI memory journals and promoted memory docs."
memory_eligible: true
memory_priority: "high"
doc_tags:
  - "domain:team-ai-memory"
  - "type:memory_index"
---
# Team AI Memory Index

## Purpose

This file is the transaction log for the team's AI memory package.

Agents should append small entries here whenever they create or update dated
journals, weekly summaries, or promoted memory docs.

## Current Memory Map

- `journals/2026/06/2026-06-03_example-user.md` — example dated person journal.
- `weekly/2026-W23.md` — example weekly transaction rollup.
- `promoted/team-ai-current-patterns.md` — example durable memory doc.
- `../docs/MEMORY_GOVERNANCE.md` — policy for logging, redaction, review,
  promotion, and retention.

## Transaction Log

- `2026-06-03` — created initial memory package template.
- `2026-06-03` — added example journal, weekly rollup, and promoted memory doc.
- `2026-06-03` — linked memory package to explicit governance policy.

## Example Transaction Entries

- `2026-06-03` — `example-user` added install-hook decision to daily journal.
- `2026-06-03` — review agent promoted "memory must be incremental" into
  `promoted/team-ai-current-patterns.md`.
- `2026-W23` — weekly rollup captured repeated setup friction around tool
  configuration and missing team-specific context.
