---
name: code-review-prep-ops
description: Prepare code changes for review with scoped diffs, verification, and review notes.
memory_tags:
  - domain:engineering
  - workflow:code-review
  - repo_boundary:team
  - risk:medium
---

# Code Review Prep Ops

## Trigger

Use when preparing a local change for review.

## Inputs

- Required: current working tree, intended review scope, and repo instructions
- Optional: tickets, design docs, rollback notes, or reviewer-specific context

## Workflow

1. Read the local repo instructions and package docs.
2. Inspect the working tree and preserve unrelated user changes.
3. Sync/rebase according to team policy.
4. Confirm the diff is scoped to the intended packages.
5. Run the relevant build/test commands.
6. Use the repo or package review template if one exists.
7. Summarize:
   - what changed
   - why it changed
   - what was verified
   - what risk remains

## Output Contract

Return:

- scoped diff summary
- verification performed
- remaining risk or rollback notes
- any links to tickets or design docs

## Review Rules

- Do not mix unrelated cleanup into the same review.
- Do not claim verification that was not run.
- Include rollback notes for risky changes.
- Link to tickets/design docs when relevant.
