---
name: writing-plans
description: >
  Creates a detailed, chunk-by-chunk implementation plan from an approved spec.
  Every task must be 2–5 minutes of work. Every task includes a verification step.
  Triggers on: "write the plan", "create implementation plan", "plan this out",
  or after define-spec completes.
---

# Skill: writing-plans

You are writing an implementation plan. Every task must be small enough to complete in 2–5 minutes.
If a task would take longer, split it. Non-negotiable.

## Pre-check

Confirm the spec exists at `docs/specs/[feature-name]-spec.md`.
If not, stop: "Please run `/define-spec` before writing a plan."

## Step 1 — Inventory First

Before writing any tasks, do a complete inventory:
- List every file that will be created
- List every file that will be modified
- List every dependency that will be added
- List every database migration or schema change

Present this inventory and ask: "Anything missing from this list?"

## Step 2 — Plan Structure

Organise work into phases:

```
Phase 1: Setup / Scaffolding
Phase 2: Core Logic
Phase 3: Tests (written BEFORE implementation in each phase)
Phase 4: Integration
Phase 5: Verification
```

Each phase gets sign-off before you detail the next.

## Step 3 — Task Format

Every task must follow this exact format:

```
### Task [N]: [Short name]
**Phase:** [phase name]
**Estimated time:** [2–5 min]
**File(s):** [exact file path(s)]

**What to do:**
[3–7 bullet points of specific instructions. Clear enough for someone with no project context.]

**Test first (if implementation task):**
Write this failing test before writing any implementation code:
[exact test description or pseudocode]

**Verification:**
Run: [exact command]
Expected: [exact expected output]
Done when: [specific pass condition]
```

## Step 4 — Small Chunk Enforcement

Before finalising each task, ask:
> "Can a focused engineer complete this in under 5 minutes with no distractions?"

If the answer is no — split the task.

Common splits:
- "Create file + write logic" → split into "Create file with stub" and "Implement logic"
- "Write test + make it pass" → always separate tasks
- "Multiple functions" → one task per function

## Step 5 — Save the Plan

Save to:
```
docs/plans/[feature-name]-plan.md
```

Header includes:
- Feature name
- Spec reference
- Total task count
- Estimated total time
- Date created

## Step 6 — Update MEMORY.md

```
Stage: writing-plans ✅ → next: write-tests (Task 1)
Plan location: docs/plans/[feature-name]-plan.md
Total tasks: [N]
```

Then say:
> "Plan saved. [N] tasks, estimated [X] minutes total.
> Next step: run `/write-tests` to begin Task 1."

## QA Gate

- [ ] Every task has a verification step
- [ ] Every implementation task has a "test first" instruction
- [ ] No task exceeds 5 minutes estimated
- [ ] Complete file inventory documented
- [ ] Plan saved and MEMORY.md updated
