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

## Inputs

- Required: target service/package, requested change, and current repo context
- Optional: design docs, runbooks, ticket links, or rollback notes

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

## Output Contract

Return:

- the service or package touched
- the change made
- the verification run
- remaining API, schema, migration, or rollback risk

## Verification

Replace these with real commands:

```bash
make test-example-service
make lint-example-service
```

## Guardrails

- Do not widen the scope from one service into unrelated cleanup.
- Do not claim service verification that was not actually run.
- Preserve team-owned docs and operating constraints when they exist.
