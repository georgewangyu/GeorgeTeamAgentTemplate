---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/docs/MEMORY_GOVERNANCE"
doc_type: "guide"
doc_status: "active"
title: "Memory Governance"
description: "Policy for incremental memory logging, redaction, review, promotion, and retention."
memory_eligible: true
memory_priority: "high"
doc_tags:
  - "domain:team-ai-memory"
  - "type:guide"
---
# Memory Governance

Memory should make future sessions sharper without becoming a private-data
dump.

## What To Log

Log concise entries for:

- meaningful changes
- decisions
- blockers
- verification commands and results
- follow-up memory candidates

## What Not To Log

Do not log:

- secrets or credentials
- customer data
- private user data
- raw incident timelines that include sensitive identifiers
- legal, HR, finance, or security details unless the team has an approved
  storage policy

## Promotion Policy

Dated journals are scratch memory. Promoted docs are maintained memory.

A review agent may promote a note when it is:

- repeated across multiple sessions
- still true after review
- useful for future agents
- public-safe or stored in an approved private package
- owned by a team that can update it

Humans should review policy and behavior changes. They should not need to
approve every tiny journal entry.

## Retention

Teams should decide how long dated journals remain available.

The default template stance:

- keep promoted memory as maintained docs
- periodically summarize or archive dated journals
- delete memory that is stale, sensitive, or no longer owned
