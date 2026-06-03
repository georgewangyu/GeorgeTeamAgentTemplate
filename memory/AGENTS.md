---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/memory/AGENTS"
doc_type: "agent_spec"
doc_status: "active"
title: "Memory Instructions"
description: "Local instructions for maintaining incremental team AI memory."
memory_eligible: false
memory_priority: "low"
doc_tags:
  - "domain:team-ai-memory"
  - "type:agent_spec"
---
# Memory Instructions

This folder demonstrates the shape of a separate memory package.

## Rules

- In production, prefer a separate `TeamAIMemory` package.
- Journal incrementally as work happens.
- Do not wait until the end of a long session.
- Use `journals/YYYY/MM/YYYY-MM-DD_person.md` for dated person logs.
- Use `weekly/YYYY-Www.md` for rollups.
- Use `promoted/` for durable memory docs.
- Keep `memory/index.md` updated as the transaction log.
- Never store secrets, credentials, customer data, or private user data.

