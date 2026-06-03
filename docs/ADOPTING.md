---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/docs/ADOPTING"
doc_type: "guide"
doc_status: "active"
title: "Adopting The Template"
description: "Checklist for customizing and rolling out the team AI package template."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai"
  - "type:guide"
---
# Adopting The Template

Use this checklist to turn the public scaffold into a team-owned package.

## First 30 Minutes

1. Rename `GeorgeTeamAgentTemplate` and `team-ai` to the real package and agent
   names.
2. Replace `platform-ai-team` owners in `package.example.yaml` and
   `agents/team-ai.agent-spec.json`.
3. Replace example MCP commands with real tool server commands.
4. Replace context discovery examples in `context/team-context-discovery.md`.
5. Replace sample skills with two or three workflows the team already repeats.
6. Run `npm run validate` or `node scripts/validate.js`.
7. Run `./hooks/install.sh --dry-run` before touching shell config.

## Rollout Path

Start with one team and one runtime adapter.

The first rollout should prove:

- a new engineer can install the package without reading private setup lore
- startup lists the expected context and skills
- auto-update can be disabled or pinned
- uninstall removes the managed launcher cleanly
- memory logging does not capture secrets or customer data

## Publishing Internally

Publish the template as a normal internal repo or package.

At minimum, document:

- owner team
- supported runtimes
- update channel
- compatibility policy
- hook review process
- escalation path when install or startup fails
