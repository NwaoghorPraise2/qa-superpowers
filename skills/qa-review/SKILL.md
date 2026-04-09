---
name: qa-review
description: >
  Final QA gate before a feature branch is merged. Validates functional
  correctness, test coverage, code quality, and spec compliance.
  Nothing merges without passing this review. Triggers on: "qa review",
  "ready to merge", "final review", "is this done", or after all
  tdd-implement tasks are complete.
---

# Skill: qa-review

This is the final gate. Nothing merges until this skill completes with a PASS.

## Pre-check

Confirm:
- All implementation tasks in the plan are marked complete
- All automated tests are passing
- The branch is clean (no uncommitted changes)

If any pre-check fails, stop:
> "Pre-check failed: [reason]. Resolve this before QA review."

## Stage 1 — Spec Compliance Check

Load the spec from `docs/specs/[feature-name]-spec.md`.

For each Functional Requirement (FR-01..n):
```
FR-01: [text]  → PASS / FAIL / PARTIAL
Notes: [any deviation or concern]
```

For each Acceptance Criterion (AC-01..n):
```
AC-01: [text]  → PASS / FAIL / PARTIAL
Evidence: [test name or manual check result]
```

Report: "Spec compliance: [N/N] requirements met, [N/N] ACs passing."

Any FAIL or PARTIAL → document and ask: "How do you want to handle this — fix now or raise as known issue?"

## Stage 2 — Test Coverage Check

Review test files written for this feature.

Check:
- [ ] Every AC has at least one automated test
- [ ] All edge cases from the EC register have tests
- [ ] No test is a tautology (testing that 1 === 1)
- [ ] Test names clearly describe what they test
- [ ] No tests are skipped/pending without documented reason

Report coverage percentage and any gaps.

## Stage 3 — Code Quality Check

Review implementation code:

- [ ] No debug/console.log statements left in
- [ ] No TODO comments that are actually blockers (flag them)
- [ ] Functions are single-responsibility
- [ ] No magic numbers/strings (constants are named)
- [ ] Error handling exists for failure paths
- [ ] Naming is clear and consistent with project conventions
- [ ] No unnecessary complexity added

Flag any issues as: BLOCKER / WARNING / SUGGESTION

**BLOCKERS must be fixed before merge.**
**WARNINGS should be fixed or explicitly accepted.**
**SUGGESTIONS are recorded for future improvement.**

## Stage 4 — Regression Check

Ask: "Have any existing tests broken?"

Run the full test suite:
> `[project test command]`

If anything fails that was passing before: **STOP. This is a blocker.**

## Stage 5 — Manual Verification

Load manual test scripts from `docs/test-cases/[feature-name]-manual-tests.md`.

Work through each script with the user:
- "Run manual test [N] now. What's the result?"
- Record: PASS / FAIL / NOT TESTED

If any manual test fails → document the failure with steps to reproduce.

## Stage 6 — QA Summary Report

Generate:

```markdown
# QA Review — [Feature Name]
**Date:** [today]
**Reviewer:** Claude (QA Superpowers)
**Branch:** [branch name]

## Verdict: [PASS ✅ / FAIL ❌ / CONDITIONAL PASS ⚠️]

## Spec Compliance
- FRs: [N/N] passing
- ACs: [N/N] passing

## Test Coverage
- Automated: [N] tests, [N] passing
- Manual: [N/N] scripts passing
- Coverage gaps: [list or "None"]

## Code Quality
- Blockers: [list or "None"]
- Warnings: [list or "None"]

## Regression
- Full suite: [PASS / FAIL]
- Tests broken: [list or "None"]

## Decision
[APPROVED FOR MERGE / RETURN FOR FIXES — with specific items listed]
```

Save to: `docs/qa-reports/[feature-name]-qa-report.md`

## Stage 7 — Update MEMORY.md

```
Stage: qa-review ✅
QA verdict: [PASS / FAIL / CONDITIONAL]
Report: docs/qa-reports/[feature-name]-qa-report.md
Next: [finishing-a-development-branch / fix [N] blockers]
```

## If PASS

Say:
> "QA Review PASSED. This feature is approved for merge.
> Run `/finishing-a-development-branch` to complete the workflow."

## If FAIL

Say:
> "QA Review FAILED. [N] blockers must be resolved before merge.
> Return to `/tdd-implement` to address the blockers listed above."
