---
name: tdd-implement
description: >
  Implements features using strict RED-GREEN-REFACTOR TDD. One task at a time.
  Failing test must exist before any implementation. Enforces small chunks.
  Triggers on: "implement", "start coding", "make the tests pass", or after
  write-tests confirms all tests are failing.
---

# Skill: tdd-implement

You are implementing one task at a time. RED-GREEN-REFACTOR. No exceptions.

## The Law

1. **RED** — A failing test must exist. If it doesn't, stop and write it first.
2. **GREEN** — Write the MINIMUM code to make the test pass. Nothing more.
3. **REFACTOR** — Clean up without changing behaviour. Tests still pass after.
4. **COMMIT** — Commit after every green. Small, atomic commits.
5. **REPEAT** — Move to the next task only after the current one is committed.

If you write implementation code before a failing test exists:
> "⛔ STOP. Implementation code written before a failing test. Delete the implementation.
> Run `/write-tests` to write the test first, then come back."

## Step 1 — Load the Current Task

Read the plan at `docs/plans/[feature-name]-plan.md`.
Identify the current task (smallest uncompleted unit).
State it clearly:
> "Current task: Task [N] — [name]. Estimated time: [X] min."

## Step 2 — RED Phase

Confirm the failing test:
> "Run the test for this task now:
> `[exact test command]`
> Confirm it fails with: [expected failure message]"

Wait for user confirmation of failure.
Do not write implementation until failure is confirmed.

## Step 3 — GREEN Phase

Write the **minimum** code to make the test pass.

Rules for minimum code:
- No extra features, even obvious ones
- No premature abstractions
- No code for future requirements (YAGNI)
- If three lines works, don't write five

After writing, say:
> "Run the test now:
> `[exact test command]`
> Expected: PASSING"

If it still fails:
> "Still failing. Let's look at the error together before changing anything else."

Read the actual error. Address only what the error says. Do not guess.

## Step 4 — REFACTOR Phase

With green tests, clean up:
- Remove duplication
- Improve naming
- Extract functions if needed for clarity
- Apply project coding standards

After each refactor change:
> "Run tests again: `[command]` — confirming still green."

Only refactor one thing at a time. Confirm green after each.

## Step 5 — COMMIT

```
git add [specific files only]
git commit -m "[type]: [task name] — AC-[N]"
```

Commit message format:
- `feat:` for new functionality
- `fix:` for bug fixes
- `test:` for test-only changes
- `refactor:` for refactor-only changes

## Step 6 — Update MEMORY.md

After each completed task:
```
Completed: Task [N] — [name] ✅
Next: Task [N+1] — [name]
Last commit: [commit hash short]
```

## Step 7 — Next Task Gate

Before moving to the next task, confirm:
- [ ] Test passes (GREEN confirmed)
- [ ] Refactor done (if needed)
- [ ] Committed
- [ ] MEMORY.md updated

Then say:
> "Task [N] complete. Ready for Task [N+1].
> Say 'continue' or run `/tdd-implement` to proceed."

## Stuck Protocol

If a task is taking more than 5 minutes:

> "We've been on this task for more than 5 minutes. Let's stop and diagnose.
> Options:
> A) Split this task — it's bigger than we thought
> B) Debug the issue systematically — run `/systematic-debugging`
> C) Revisit the spec — the requirement may be unclear"

Ask which option the user wants. Do not continue guessing.

## All Tasks Complete

When the last task in the plan is committed:
> "All implementation tasks complete. Tests are passing.
> Run `/qa-review` before merging."
