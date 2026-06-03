---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/examples/kiro"
doc_type: "adapter_doc"
doc_status: "active"
title: "Kiro Adapter Notes"
description: "Adapter notes for using GeorgeTeamAgentTemplate with Kiro-style agent specs."
memory_eligible: true
memory_priority: "low"
doc_tags:
  - "domain:team-ai"
  - "type:adapter_doc"
---
# Kiro Adapter Notes

This template can be adapted to Kiro or any agent runtime that accepts an agent
spec file.

Map:

- `agents/team-ai.agent-spec.json` -> runtime agent definition
- `context/*.md` -> context loaded by the agent
- `skills/**/SKILL.md` -> skills loaded by wildcard or dependency package
- `clientConfig.portable.hooks` -> install/start/session hooks

Example launcher:

```bash
TEAM_AI_COMMAND="kiro-cli chat --agent team-ai" ./hooks/install.sh
ai
```

For runtimes that support inline hooks, copy the pattern from
`clientConfig.exampleInlineHookStyle`.

## Suggested Kiro Mapping

- Keep `agents/team-ai.agent-spec.json` as the canonical agent definition.
- Register lifecycle hooks from `clientConfig.portable.hooks`.
- Treat `package.example.yaml` as the package manager adapter input.
- Use `schemas/agent-spec.schema.json` as the starting contract for stricter
  runtime validation.
- Run `./hooks/doctor.sh` before publishing a package update.
