---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/skills/README"
doc_type: "readme"
doc_status: "active"
title: "Team AI Skills Package"
description: "Template for a separate team-owned skills package."
memory_eligible: true
memory_priority: "low"
doc_tags:
  - "domain:team-ai-skills"
  - "type:readme"
---
# Skills

Skills are reusable workflow instructions owned by the teams closest to the
work.

In production, this should usually be a separate package, for example
`TeamAISkills`, depended on by the top-level team agent package.

It lives inside this template only so people can see the pattern without opening
another repo.

Use skills for workflows that are:

- repeated
- fragile
- team-specific
- easy to forget
- worth standardizing

Examples:

- code review preparation
- release checklist
- incident debugging
- data migration
- API compatibility review
- customer escalation triage

The top-level agent package can include all skills with a wildcard or package
dependency, but each domain team should own its own skill files.

## Structure

```text
skills/
├── README.md
├── index.md
├── IMPROVEMENTS.md
├── code-review-prep-ops/
│   └── SKILL.md
└── service-change-ops/
    └── SKILL.md
```

## Skill Frontmatter

Use this portable skill header:

```yaml
---
name: code-review-prep-ops
description: Prepare code changes for review with scoped diffs, verification, and review notes.
memory_tags:
  - domain:engineering
  - workflow:code-review
  - repo_boundary:team
  - risk:medium
---
```

## Index Rule

Keep `skills/index.md` updated with every available skill, owner, trigger, and
status.
