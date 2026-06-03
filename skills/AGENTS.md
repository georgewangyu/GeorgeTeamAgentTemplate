---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/skills/AGENTS"
doc_type: "agent_spec"
doc_status: "active"
title: "Skills Instructions"
description: "Local instructions for maintaining reusable team AI skills."
memory_eligible: false
memory_priority: "low"
doc_tags:
  - "domain:team-ai-skills"
  - "type:agent_spec"
---
# Skills Instructions

This folder demonstrates the shape of a separate skills package.

## Rules

- In production, prefer a separate `TeamAISkills` package.
- Each skill lives in `skills/<skill-name>/SKILL.md`.
- Each `SKILL.md` uses `name`, `description`, and `memory_tags` frontmatter.
- Keep skills focused on repeated, fragile, or team-specific workflows.
- Update `skills/index.md` when adding, renaming, or retiring a skill.
- Use `skills/IMPROVEMENTS.md` for the skill backlog.

