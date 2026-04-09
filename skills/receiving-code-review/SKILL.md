---
name: receiving-code-review
description: >
  Guides structured, non-defensive responses to code review feedback.
  Categorises feedback, plans changes, and ensures all points are resolved
  before re-requesting review. Triggers on: "got review feedback",
  "reviewer left comments", "responding to PR comments", or when
  review feedback needs to be worked through.
---

# Skill: receiving-code-review

You received feedback. Process it systematically. Do not be defensive. Do not ignore it.

## Step 1 — Categorise Every Comment

For each piece of feedback, assign it a category:

```
BLOCKER    — Must fix before merge. Code is wrong, tests fail, or spec violated.
WARNING    — Should fix. Technical debt, risky pattern, or quality concern.
SUGGESTION — Take or leave. Style preference or future improvement idea.
QUESTION   — Reviewer wants clarification, not necessarily a change.
PRAISE     — Noted. No action needed.
```

List every comment with its category. Present to user:
> "Review received. [N] blockers, [M] warnings, [P] suggestions, [Q] questions."

## Step 2 — Resolve Blockers First

For each BLOCKER:

1. Understand exactly what's wrong
2. Write (or update) a failing test that exposes the issue
3. Fix it using tdd-implement (RED-GREEN-REFACTOR)
4. Confirm fix with passing test
5. Mark as resolved with evidence

Do not respond to the reviewer until all blockers are fixed.

## Step 3 — Decide on Warnings

For each WARNING, decide:
- **Fix now** — if it's quick and clearly right
- **Fix in follow-up** — if it requires significant rework; create a ticket
- **Disagree** — if you have a strong reason; document your reasoning

For disagreements:
> "I'm choosing not to change this because: [technical reason].
> I'm open to discussing further."

Never silently ignore a warning.

## Step 4 — Respond to Questions

For each QUESTION, write a clear response. If the question reveals an unclear naming or missing comment → fix the code to make the intent obvious, not just explain in the PR thread.

## Step 5 — Re-Request Review

After resolving all blockers and decided-on warnings:

```markdown
Review Response:

Blockers resolved:
- [Comment N]: [what was changed and how] ✅

Warnings addressed:
- [Comment N]: Fixed ✅ / Deferred to [ticket] / Disagree because [reason]

Questions answered:
- [Comment N]: [answer]

All tests passing. Ready for re-review.
```
