---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/VISION"
doc_type: "vision"
doc_status: "active"
title: "GeorgeTeamAgentTemplate Vision"
description: "Strategic direction for the team AI setup template."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai"
  - "type:vision"
---
# GeorgeTeamAgentTemplate Vision

GeorgeTeamAgentTemplate should be a public-safe starter for packaging a team's
AI workflow as installable infrastructure.

## Product Thesis

Teams do not need another loose prompt bundle. They need a repeatable package
that installs base instructions, tools, skills, hooks, memory conventions, and
safety docs so every engineer starts from the same operating layer.

## Goals

- Make team agent setup installable and inspectable.
- Keep root instructions, skills, hooks, memory, and schemas clearly separated.
- Provide enough examples to adapt the template without copying private data.
- Preserve validation and doctor checks as part of the package contract.

## Non-Goals

- Do not lock the template to one agent runtime prematurely.
- Do not store customer data, secrets, or private team memory in the template.
- Do not add nested instruction files that only repeat root behavior.
