---
name: requesting-code-review
description: >
  Prepares and requests a code review. Runs a pre-review checklist to avoid
  wasting reviewer time. Triggers on: "request code review", "ready for review",
  "PR review", "code review", or between major implementation tasks when a
  peer or senior review is appropriate.
---

# Skill: requesting-code-review

You are preparing work for review. The pre-review checklist must pass before you ask anyone to review.

## Pre-Review Self-Check

Complete this before requesting review:

### Code Quality
- [ ] All automated tests passing (run them now, paste output)
- [ ] No debug/console statements left in
- [ ] No commented-out code blocks
- [ ] All TODOs either resolved or explicitly noted as future work
- [ ] Variable and function names clearly describe intent

### Test Quality
- [ ] New code has test coverage
- [ ] Tests cover both happy path and failure paths
- [ ] No tests are skipped without documented reason

### Spec Alignment
- [ ] Each changed file maps to a task in the plan
- [ ] No scope creep (changes beyond the plan scope are noted)
- [ ] Acceptance criteria are all addressed

### PR Hygiene
- [ ] Branch is up to date with main/develop
- [ ] Commits are clean and atomic (each commit does one thing)
- [ ] Commit messages follow the format: `type: description — AC-N`
- [ ] PR description written (see format below)

## PR Description Format

```markdown
## What
[One paragraph describing what this PR does]

## Why
[The feature/bug this addresses and why it matters]

## How
[Brief technical approach taken]

## Acceptance Criteria Addressed
- AC-01: [text] ✅
- AC-02: [text] ✅

## Testing
- Automated: [N] tests added, all passing
- Manual: [describe what was manually verified]

## Screenshots / Evidence
[If UI changes: before/after. If API: example request/response]

## Notes for Reviewer
[Anything unusual, trade-offs made, or specific areas to focus on]
```

## Requesting the Review

After pre-check passes:
> "Pre-review checklist complete. Ready for review.
> Reviewer focus areas: [2–3 specific things to pay attention to]"

If any pre-check item fails:
> "Pre-review blocked: [item]. Resolve before requesting review."
