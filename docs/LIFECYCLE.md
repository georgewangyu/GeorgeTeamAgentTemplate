---
doc_schema: "doc-frontmatter-v1"
doc_id: "GeorgeTeamAgentTemplate/docs/LIFECYCLE"
doc_type: "guide"
doc_status: "active"
title: "Lifecycle Commands"
description: "Lifecycle command reference for installing, starting, validating, logging, and uninstalling the package."
memory_eligible: true
memory_priority: "medium"
doc_tags:
  - "domain:team-ai"
  - "type:guide"
---
# Lifecycle Commands

The package should be boring to operate.

## Install

Preview first:

```bash
./hooks/install.sh --dry-run
```

Install:

```bash
./hooks/install.sh
```

## Start

```bash
./hooks/agent-start.sh
```

The installed alias runs the same startup hook before launching the configured
agent command.

## Update Controls

Session-start update checks happen inside `hooks/agent-start.sh`.

Disable automatic session-start updates:

```bash
TEAM_AI_AUTO_UPDATE=0 ./hooks/agent-start.sh
```

Require a pinned ref:

```bash
TEAM_AI_PINNED_REF=v0.1.0 ./hooks/agent-start.sh
```

Teams using pinned refs should tag releases and update `CHANGELOG.md` before
moving the pin.

## Validate

```bash
npm run validate
./hooks/doctor.sh
```

`doctor.sh` also prints the context and skill files discovered by startup.

## Session Summary

```bash
./hooks/session-summary.sh
```

## Uninstall

Preview first:

```bash
./hooks/uninstall.sh --dry-run
```

Uninstall:

```bash
./hooks/uninstall.sh
```
