---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/examples/codex"
doc_type: "adapter_doc"
doc_status: "active"
title: "Codex Adapter Notes"
description: "Adapter notes for using GeorgeTeamAgentTemplate with Codex."
memory_eligible: true
memory_priority: "low"
doc_tags:
  - "domain:team-ai"
  - "type:adapter_doc"
---
# Codex Adapter Notes

This template can be adapted to Codex by mapping:

- `context/*.md` -> repo instructions or skills loaded at session start
- `skills/**/SKILL.md` -> Codex skills or local instruction docs
- `hooks/install.sh` -> local setup command
- `hooks/agent-start.sh` -> command run before starting a session
- `hooks/session-summary.sh` -> incremental memory journal capture

Example launcher:

```bash
TEAM_AI_COMMAND="codex" ./hooks/install.sh
ai
```

If your environment supports custom MCP servers, map the tool registry entries
from `agents/team-ai.agent-spec.json` to the local MCP configuration.

## Suggested Codex Mapping

- Put this package in a shared internal repository.
- Copy or symlink `AGENTS.md` into the repo root where Codex starts, or configure
  the launcher to start Codex from this package before entering the target repo.
- Install Codex skills from `skills/**/SKILL.md` using the team's normal skill
  installation path.
- Convert `dependencies.mcpRegistry` into the Codex MCP configuration format.
- Run `TEAM_AI_AUTO_UPDATE=0 ai` when debugging local edits to the package.

## Verification

```bash
npm run validate
./hooks/doctor.sh
TEAM_AI_AUTO_UPDATE=0 ./hooks/agent-start.sh
```
