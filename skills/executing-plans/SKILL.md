---
name: executing-plans
description: >
  Executes a written implementation plan in batches with human checkpoints.
  Each batch is reviewed before proceeding. Triggers on: "execute the plan",
  "run the plan", "let's implement this", after writing-plans completes, or
  when a plan exists and implementation should begin.
---

# Skill: executing-plans

You are executing a plan. One batch at a time. Human checkpoint after each batch.

## Pre-check

Load the plan from `docs/plans/[feature-name]-plan.md`.
Count total tasks. State:
> "Plan loaded. [N] tasks total. I'll execute in batches of [3–5] with checkpoints."

## Batch Size Rule

Default batch size: **3 tasks** for complex work, **5 tasks** for simple/mechanical work.
Never execute more than 5 tasks without a checkpoint.

## Executing a Batch

For each task in the batch:

1. State: "Starting Task [N]: [name]"
2. Follow the task instructions exactly as written
3. For implementation tasks: follow the tdd-implement skill (RED-GREEN-REFACTOR)
4. Run verification for the task
5. State: "Task [N] complete. [test output summary]"

After all tasks in the batch:

```
Batch [N] complete:
  ✅ Task [X]: [name]
  ✅ Task [Y]: [name]
  ✅ Task [Z]: [name]

All tests passing: [yes/no]
Next batch: Tasks [A], [B], [C]

Proceed? (yes / stop / adjust)
```

Wait for human confirmation before executing the next batch.

## Checkpoint Options

**"yes"** → proceed with next batch as planned
**"stop"** → save progress to MEMORY.md, end session cleanly
**"adjust"** → discuss what needs to change before continuing

## Deviation Protocol

If a task turns out differently than planned:
> "Task [N] deviated from plan: [what happened vs what was expected].
> Options:
> A) Update the plan and continue
> B) Pause and re-evaluate with /brainstorming
> C) Skip this task and note it as blocked"

Do not silently deviate. Always surface it.

## Completion

When all tasks are done:
> "All [N] tasks complete. Tests passing.
> Ready for QA review. Run `/qa-review`."

Update MEMORY.md:
```
Stage: executing-plans ✅ → next: qa-review
All tasks: [N/N] complete
```
