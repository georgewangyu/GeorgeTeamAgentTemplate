---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/memory/promoted/team-ai-current-patterns"
doc_type: "memory_doc"
doc_status: "active"
title: "Team AI Current Patterns"
description: "Example promoted memory doc for durable team AI setup patterns."
memory_eligible: true
memory_priority: "high"
doc_tags:
  - "domain:team-ai-memory"
  - "type:memory_doc"
---
# Team AI Current Patterns

## One-Command Setup

The team AI setup should be installable with one command.

That install should provide the agent spec, `AGENTS.md`, tool/MCP config,
shared skills, team-owned skills, startup hooks, update hooks, and memory
logging hooks.

## Context Package Shape

Every meaningful package or folder should include:

- `README.md`
- `index.md`
- `IMPROVEMENTS.md`

`index.md` is the agent-readable transaction map.

## Incremental Memory

Do not rely on end-of-session summaries alone.

Agents should journal after meaningful changes, decisions, blockers, and
verification steps. Review agents can later promote repeated patterns into
durable memory docs.
