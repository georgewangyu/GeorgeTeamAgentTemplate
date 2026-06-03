---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/docs/SAFETY"
doc_type: "guide"
doc_status: "active"
title: "Safety And Trust"
description: "Trust boundaries, hook review rules, shell config behavior, and auto-update controls for the team AI package."
memory_eligible: true
memory_priority: "high"
doc_tags:
  - "domain:team-ai"
  - "type:guide"
---
# Safety And Trust

This package asks engineers to run hooks. That means the hooks need clear
boundaries.

## Hook Rules

- Hooks must be readable shell scripts in `hooks/`.
- Hooks must be safe to run repeatedly.
- Hooks must not store secrets, credentials, customer data, or private user
  data.
- Hooks must not run destructive commands.
- Hooks must support dry-run mode when they modify local user state.
- Hook changes should be reviewed like code, not treated like inert docs.

## Shell Config Writes

`install.sh` writes a managed alias block with explicit start and end markers.

`uninstall.sh` only removes that managed block. It leaves user-owned aliases
alone.

## Auto-Update Controls

Session-start auto-update is enabled by default because stale context is a real
team failure mode.

Controls:

- `TEAM_AI_AUTO_UPDATE=0`: skip auto-update.
- `TEAM_AI_PINNED_REF=<ref>`: require a pinned Git ref and refuse automatic
  update when the checkout does not match it.
- `TEAM_AI_ALLOW_DIRTY_UPDATE=1`: allow updates when the package checkout has
  local changes.

Default dirty-checkout behavior is to skip update. That protects local template
experiments from being overwritten by package sync.

## Adoption Gate

Before a team makes this package official, run:

```bash
./hooks/install.sh --dry-run
npm run validate
./hooks/doctor.sh
```
