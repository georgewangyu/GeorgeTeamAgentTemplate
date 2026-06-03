---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/index"
doc_type: "index"
doc_status: "active"
title: "GeorgeTeamAgentTemplate Index"
description: "Agent-readable index of the template structure, current state, and transaction log."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai"
  - "type:index"
---
# GeorgeTeamAgentTemplate Index

## Current State

- Starter package template exists.
- Core shape includes root instructions, agent spec, context discovery, hooks,
  skills, memory, docs, validation, schemas, changelog, and CI.
- Nested `AGENTS.md` examples are intentionally limited to folders with local
  behavior: `hooks/`, `skills/`, and `memory/`.
- Memory is included here for demonstration, but should usually be a separate
  package in production.

## Important Files

- `AGENTS.md` — universal team base agent instructions.
- `README.md` — package philosophy and setup guide.
- `package.example.yaml` — generic package/build target shape.
- `agents/team-ai.agent-spec.json` — example portable agent spec.
- `context/team-context-discovery.md` — team-specific context discovery rules.
- `hooks/` — install, startup, doctor, uninstall, and session-summary hooks.
- `skills/` — example reusable workflow skills.
- `memory/` — example memory package shape.
- `docs/ADOPTING.md` — customization and rollout checklist.
- `docs/LIFECYCLE.md` — lifecycle command reference.
- `docs/SAFETY.md` — hook and auto-update trust policy.
- `docs/MEMORY_GOVERNANCE.md` — memory logging and promotion policy.
- `scripts/validate.js` — dependency-free validator.
- `schemas/` — optional/reference package and agent spec schemas.
- `.github/workflows/validate.yml` — example CI validation workflow.

## Transaction Log

- `2026-06-03` — created initial public-safe template.
- `2026-06-03` — added memory, skills, hooks, adapters, validation, schemas,
  changelog, CI, and operational docs.
- `2026-06-03` — simplified the starter template by removing boilerplate
  `AGENTS.md` files and folding helper hooks into startup/doctor.
