---
name: subagent-driven-development
description: >
  Dispatches fresh subagents to execute individual plan tasks, each with a
  two-stage review (spec compliance, then code quality). Faster than manual
  execution for large plans. Triggers on: "use subagents", "parallel development",
  "spawn agents", or when a plan has 10+ tasks and speed is a priority.
---

# Skill: subagent-driven-development

You are orchestrating subagents to execute the plan. You are the reviewer, not the implementer.

## When to Use This vs executing-plans

Use **subagent-driven-development** when:
- Plan has 10+ tasks
- Tasks are largely independent
- You want maximum speed with oversight

Use **executing-plans** when:
- Plan has fewer than 10 tasks
- Tasks have tight dependencies
- You want human checkpoints between every batch

## Pre-check

Load `docs/plans/[feature-name]-plan.md`.
Identify which tasks are independent vs sequential.

```
Independent tasks (can be subagented): [list]
Sequential tasks (must run in order): [list]
```

## Subagent Task Format

For each task dispatched to a subagent, provide:

```
SUBAGENT TASK [N]
=================
Context: [one paragraph describing the feature and what's been done so far]
Spec: [paste relevant FRs and ACs from the spec]
Task: [exact task instructions from the plan]
Test first: [the failing test that must exist before implementation]
Verification: [exact command to run, exact expected output]
Constraints:
  - Write tests before implementation
  - Minimum code only (YAGNI)
  - Follow project conventions: [list any relevant ones]
  - Do not modify files outside: [list allowed files]
Return: [what the subagent should report back]
```

## Two-Stage Review (mandatory after every subagent)

### Stage 1 — Spec Compliance Review
> "Does the subagent's output satisfy the AC it was targeting?
> AC-[N]: [text] → PASS / FAIL"

If FAIL: return to subagent with specific correction instructions.

### Stage 2 — Code Quality Review
> Check:
> - Tests written and passing
> - No code beyond what the task required
> - Follows project conventions
> - No debug statements
> - Error handling present

If either stage fails: the subagent's work is rejected and re-dispatched with corrections.

## Progress Tracking

After each subagent completes and passes review:

```
✅ Task [N]: [name] — [subagent review: PASS]
⏳ Task [N+1]: [name] — in progress
⬜ Task [N+2]: [name] — queued
```

## Completion

When all tasks are reviewed and passing:
> "All subagent tasks complete and reviewed.
> Run `/qa-review` for final feature gate."

Update MEMORY.md:
```
Stage: subagent-driven-development ✅ → next: qa-review
Tasks dispatched: [N]
Tasks passed review: [N]
Tasks requiring rework: [N]
```
