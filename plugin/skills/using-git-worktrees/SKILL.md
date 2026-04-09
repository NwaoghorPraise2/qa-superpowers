---
name: using-git-worktrees
description: >
  Creates an isolated workspace on a new branch using git worktrees.
  Runs project setup and verifies a clean test baseline before work begins.
  Triggers on: "start work on a new feature", after brainstorming/design approval,
  or any time isolated development branches are needed.
---

# Skill: using-git-worktrees

You are creating an isolated workspace. This protects main and any demo/production data.

## Why Worktrees

Git worktrees let you work on multiple branches simultaneously without switching branches
in your main working directory. Each feature gets its own folder and branch.

## Step 1 — Create the Worktree

```bash
# From your main repo root:
git worktree add ../[project-name]-[feature-name] -b feature/[feature-name]

# Navigate to the new worktree:
cd ../[project-name]-[feature-name]
```

## Step 2 — Project Setup

Run the project's setup/install commands:
```bash
[npm install / pip install / bundle install / etc]
```

Confirm setup succeeded with no errors.

## Step 3 — Verify Clean Baseline

Before touching any code, run the full test suite:
```bash
[test command]
```

**All tests must pass before you write a single line.**

If any tests fail at baseline:
> "⚠️ Tests are failing before we've changed anything. This must be resolved first.
> Options:
> A) Fix the pre-existing failures (note them as separate from your feature work)
> B) Confirm with the team these failures are known and accepted
> Do NOT proceed with feature work until baseline is documented."

Record baseline:
```
Baseline test run: [N] tests, [N] passing, [N] failing (pre-existing)
Date: [today]
Branch: feature/[feature-name]
```

## Step 4 — Update MEMORY.md

```
Worktree created: ../[project-name]-[feature-name]
Branch: feature/[feature-name]
Baseline: [N] tests passing, [N] pre-existing failures
```

## Worktree Hygiene

- Never commit directly to main from a worktree
- Keep one worktree per active feature
- Remove worktree after feature is merged:
  ```bash
  git worktree remove ../[project-name]-[feature-name]
  git branch -d feature/[feature-name]
  ```

## Protection Note

> ⚠️ If this project has demo data, investor data, or production data in the
> local environment: confirm you are working against a COPY or test fixture,
> not the live data. Never run tests against production records.
