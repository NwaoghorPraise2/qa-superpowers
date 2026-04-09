---
name: systematic-debugging
description: >
  4-phase root cause debugging process. Blocks guessing at fixes.
  Triggers on: "there's a bug", "this is broken", "why isn't this working",
  "help me debug", "tests are failing unexpectedly", or any time a fix
  is attempted without understanding the root cause.
---

# Skill: systematic-debugging

Do not touch any code until Phase 2 is complete. Guessing at fixes is prohibited.

## Phase 1 — Observe and Describe (no code changes)

Before doing anything else, answer these questions:

1. **What is the exact error?** Copy the full error message and stack trace.
2. **What did you expect to happen?**
3. **What actually happened?**
4. **When did this start?** (Last working state, last change made)
5. **Is it consistent?** Does it happen every time or intermittently?
6. **What is the smallest reproduction?** Can you trigger it with minimal input?

Present your observations. Do not speculate on causes yet.

## Phase 2 — Root Cause Investigation (no code changes)

Map the failure path:

```
Input → [Step 1] → [Step 2] → [Step 3] → ❌ Failure point → Output
```

For each step, ask:
- Does this step receive the correct input?
- Does this step produce the correct output?
- Add a log/debug point to verify if unsure

Narrow down to the EXACT line or function where the behaviour diverges from expectation.

State: "The root cause is: [specific function/line/condition] because [evidence]."

Do not proceed until the root cause is identified with evidence, not assumption.

## Phase 3 — Pattern Analysis

Before fixing, check:

- Has this class of bug appeared elsewhere in the codebase?
- Is this a symptom of a deeper design issue?
- Are there other places with the same vulnerability?

If the same pattern appears in 3+ places → note it. The fix should address the pattern, not just the instance.

## Phase 4 — Hypothesis and Fix

Write a hypothesis:
> "If I change [X] to [Y], the test/behaviour will change from [current] to [expected] because [reason]."

Make ONE change. Run tests. Observe.

If the hypothesis was wrong:
- Do not stack another change on top
- Return to Phase 2 with the new information

If you've made three fix attempts without resolving the issue:
> "⚠️ Three failed fix attempts. This may be an architectural issue.
> Let's review the design before continuing."

## Fix Protocol

Once root cause confirmed and hypothesis validated:
1. Write (or confirm) a failing test that catches this bug
2. Apply the minimum fix
3. Confirm the test passes
4. Check for regressions: run full test suite
5. Commit: `fix: [description of what was broken and how it was fixed]`

## Update MEMORY.md

```
Bug resolved: [description]
Root cause: [one-line summary]
Fix applied: [commit reference]
```
