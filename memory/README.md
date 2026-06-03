---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/memory/README"
doc_type: "readme"
doc_status: "active"
title: "Team AI Memory Package"
description: "Template for incremental team AI memory journals, indexes, weekly logs, and promoted memory docs."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai-memory"
  - "type:readme"
---
# Team AI Memory Package

This folder shows the memory package shape.

In production, this should usually be a separate package, for example
`TeamAIMemory`, depended on by the top-level team agent package.

It lives inside this template only so people can see the pattern without opening
another repo.

## Structure

```text
memory/
├── README.md
├── index.md
├── journals/YYYY/MM/YYYY-MM-DD_person.md
├── weekly/YYYY-Www.md
└── promoted/current-patterns.md
```

## Rule

Write memory as work happens.

Do not wait until the end of a long agent session. Long sessions lose details.

Use incremental journal entries for:

- meaningful changes
- decisions
- blockers
- verification results
- follow-up memory candidates

Then use a review agent to dedupe and promote durable patterns into
`promoted/`.

## Governance

Use `../docs/MEMORY_GOVERNANCE.md` as the default policy for what can be logged,
what must be redacted, and when scratch journal entries can be promoted into
durable memory.
