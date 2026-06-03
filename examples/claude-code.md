---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/examples/claude-code"
doc_type: "adapter_doc"
doc_status: "active"
title: "Claude Code Adapter Notes"
description: "Adapter notes for using GeorgeTeamAgentTemplate with Claude Code."
memory_eligible: true
memory_priority: "low"
doc_tags:
  - "domain:team-ai"
  - "type:adapter_doc"
---
# Claude Code Adapter Notes

This template can be adapted to Claude Code by mapping:

- `AGENTS.md` instructions to project instructions
- team skills to command docs or custom slash-command workflows
- hooks to wrapper scripts around `claude`
- MCP tools to Claude Code MCP server configuration
- memory journals to the team's approved local or shared memory package

Example launcher:

```bash
TEAM_AI_COMMAND="claude" ./hooks/install.sh
ai
```

Keep the same ownership model:

- top-level package owns universal setup
- teams own their skills and instructions
- users install one umbrella package

## Suggested Claude Code Mapping

- Translate `AGENTS.md` into the relevant project instruction surface.
- Convert each `skills/**/SKILL.md` file into a slash command, command doc, or
  reusable workflow note.
- Wire MCP servers from `agents/team-ai.agent-spec.json` into the Claude Code
  MCP config.
- Use `hooks/install.sh --dry-run` before adding any shell alias.
- Use `hooks/uninstall.sh` as the offboarding path.
