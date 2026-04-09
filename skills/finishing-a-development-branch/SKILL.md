---
name: finishing-a-development-branch
description: >
  Closes out a development branch after QA review passes. Presents merge,
  PR, or discard options. Cleans up worktree. Triggers on: "ready to merge",
  "finish the branch", "wrap this up", or after qa-review returns a PASS verdict.
---

# Skill: finishing-a-development-branch

QA has passed. Now close this branch cleanly.

## Pre-check

Confirm:
- `/qa-review` has been run and returned PASS
- All tests are passing on the feature branch
- No uncommitted changes

## Step 1 — Final Verification

```bash
# Confirm tests pass one last time:
[test command]

# Confirm clean working tree:
git status

# Confirm branch is up to date:
git fetch origin
git log --oneline HEAD..origin/main  # should be empty or minimal
```

If branch is behind main → rebase or merge main in, re-run tests, confirm pass.

## Step 2 — Choose a Path

Present options:

```
How would you like to close this branch?

A) Merge to main directly
   → For small teams, trusted branch, no PR process required

B) Open a Pull Request
   → For team review, CI gate, or formal merge process

C) Keep branch open
   → Work paused, branch stays for later continuation

D) Discard
   → Work was experimental or is no longer needed
```

## Path A — Merge to Main

```bash
git checkout main
git pull origin main
git merge --no-ff feature/[feature-name] -m "feat: [feature name] — closes [ticket/AC refs]"
git push origin main
```

## Path B — Open Pull Request

Use the PR description from `/requesting-code-review`.
Confirm CI passes after PR is opened.
Set reviewers.

## Path C — Keep Open

Update MEMORY.md:
```
Stage: paused
Branch: feature/[feature-name]
Reason: [why paused]
Resume: [what needs to happen to continue]
```

## Path D — Discard

```bash
git checkout main
git worktree remove ../[project-name]-[feature-name]  # if using worktree
git branch -D feature/[feature-name]
```

Update MEMORY.md: record what was learned, why discarded.

## Step 3 — Cleanup (for A, B, D)

```bash
# Remove the worktree (if used):
git worktree remove ../[project-name]-[feature-name]

# Delete local feature branch (after merge):
git branch -d feature/[feature-name]
```

## Step 4 — Update MEMORY.md

```
Feature: [name]
Status: COMPLETE ✅ / MERGED ✅ / DISCARDED ❌ / PAUSED ⏸
Merge commit / PR: [reference]
Date: [today]

Next feature: [what's next, if known]
```

Then say:
> "Feature [name] is closed. MEMORY.md updated.
> Ready for the next feature whenever you are."
