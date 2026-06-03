---
name: service-change-ops
description: Handle service-owned changes by loading service docs, running focused verification, and capturing review risks.
memory_tags:
  - domain:engineering
  - workflow:service-change
  - repo_boundary:team
  - risk:medium
---

# Service Change Ops

## Trigger

Use when the task touches a service-owned package or directory.

## Context To Load

Replace these examples with real paths:

1. `src/example-service/README.md`
2. `src/example-service/index.md`
3. `src/example-service/docs/architecture.md`
4. service-specific runbooks under `src/example-service/runbooks/`

## Workflow

1. Identify the owning service/team.
2. Load the service docs and relevant team context.
3. Make the smallest coherent change.
4. Run focused service verification.
5. Capture API, schema, migration, or rollback risk in the review notes.

## Verification

Replace these with real commands:

```bash
make test-example-service
make lint-example-service
```

