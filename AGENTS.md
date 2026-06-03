---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/AGENTS"
doc_type: "agent_spec"
doc_status: "active"
title: "Team Base Agent Instructions"
description: "Base agent instructions every user gets when they install the team AI package."
memory_eligible: false
memory_priority: "low"
doc_tags:
  - "domain:agent-instructions"
  - "type:agent_spec"
---
# Team Base Agent Instructions

This is the universal instruction layer every user gets after running the
one-command setup.

## Goal

Help teams package their AI workflow so a new engineer can install:

- base agent instructions
- an agent spec
- MCP/tool configuration
- shared and team-owned skills
- install/start/session hooks
- lightweight memory conventions

## Startup Flow

1. Read this file first.
2. Read `README.md` for package shape and install flow.
3. Read `index.md` for the current package map.
4. Load only relevant deeper context from `context/`, `skills/`, and `memory/`.
5. Run `hooks/agent-start.sh` or the platform equivalent.

## Instruction Tree Pattern

Start with one root `AGENTS.md`.

Add a nested `AGENTS.md` only when a folder needs local rules that differ from
the root.

This template intentionally keeps only three nested examples:

- `hooks/AGENTS.md`: hook safety and portability rules
- `skills/AGENTS.md`: reusable skill package conventions
- `memory/AGENTS.md`: journal and memory promotion behavior

Avoid local `AGENTS.md` files that only repeat root behavior.

## Working Rules

- Keep changes scoped to the task.
- Preserve unrelated user edits.
- Prefer existing repo docs and local patterns.
- Run relevant validation before claiming work is done.
- Do not store secrets, credentials, customer data, or private user data in the
  memory layer.
- Use `docs/SAFETY.md` and `docs/MEMORY_GOVERNANCE.md` before rolling this out
  to a real team.

## Template Maintenance Checks

```bash
npm run validate
./hooks/doctor.sh
```
