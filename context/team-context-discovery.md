---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/context/team-context-discovery"
doc_type: "context_doc"
doc_status: "active"
title: "Team Context Discovery"
description: "Portable instructions for finding team-owned context docs, skills, and memory packages."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai"
  - "type:context_doc"
---
# Team Context Discovery

Use this file to teach the agent how to find team-specific instructions,
skills, and memory.

The top-level package should own universal behavior. Team-specific packages
should own domain behavior.

## Discovery Order

When working in a repo or package:

1. Read the nearest local agent/instruction file.
2. Read the package README.
3. Read the package `index.md` if present.
4. Identify the owning team or domain.
5. Look for a matching instruction package, skill package, and memory package.
6. Load only the relevant team docs.

## Example Mapping

Replace these examples with your own team names and paths.

```text
src/payments-*        -> TeamPaymentsContext/context/payments.md
src/search-*          -> TeamSearchContext/context/search.md
src/data-platform-*   -> TeamDataPlatformContext/context/data-platform.md
```

Use fully qualified paths. Avoid ambiguous instructions like "read the team
doc" without saying where the doc lives.

## If Team Context Is Missing

If no team-specific context exists:

1. Continue with the `AGENTS.md` instructions.
2. Tell the user which team-specific context was missing.
3. Suggest creating a context package from this template.
4. Do not invent domain rules.

## Ownership Model

- Platform or tools team owns this top-level package.
- Domain teams own their own instructions, skills, and memory packages.
- Engineers install only the top-level package.
- Updates flow through dependencies and hooks.
