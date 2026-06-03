---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/hooks/AGENTS"
doc_type: "agent_spec"
doc_status: "active"
title: "Hook Instructions"
description: "Local instructions for maintaining portable setup, startup, and memory hooks."
memory_eligible: false
memory_priority: "low"
doc_tags:
  - "domain:team-ai"
  - "type:agent_spec"
---
# Hook Instructions

This folder contains portable shell hooks.

## Rules

- Keep hooks small, readable, and platform-neutral.
- Do not execute destructive commands.
- Do not write secrets, customer data, or credentials.
- Make hooks idempotent whenever possible.
- Prefer environment variables for customization.
- Add dry-run behavior for hooks that modify user-local state.
- Keep uninstall behavior scoped to package-managed files and marker blocks.
- Validate shell syntax after edits.

## Validation

```bash
bash -n hooks/install.sh
bash -n hooks/agent-start.sh
bash -n hooks/doctor.sh
bash -n hooks/uninstall.sh
bash -n hooks/session-summary.sh
```
