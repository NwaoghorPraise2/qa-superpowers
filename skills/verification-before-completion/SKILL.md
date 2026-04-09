---
name: verification-before-completion
description: >
  Ensures work is actually done before declaring it complete. Blocks "I think
  it works" without evidence. Triggers on: "I think this is done", "that should
  work", "I've fixed it", or any claim of completion without a test run shown.
---

# Skill: verification-before-completion

You may not say "done" without running the verification and showing the output.

## Verification Checklist

Before any task is declared complete, confirm all that apply:

### Automated Tests
- [ ] Run the specific test for this task: `[command]` → output shows PASS
- [ ] Run the full test suite: `[command]` → no new failures introduced
- [ ] If tests were added: confirm they were FAILING before implementation

### Manual Verification
- [ ] Run the feature manually in the actual environment
- [ ] Check the specific AC this task addresses
- [ ] Check the edge cases relevant to this task

### Code Verification
- [ ] No debug statements left in (`console.log`, `print`, `debugger`, etc.)
- [ ] No hardcoded values that should be configurable
- [ ] Error paths behave correctly (test the failure case, not just the success case)

### Integration Verification
- [ ] Feature works end-to-end, not just in unit isolation
- [ ] No regressions in adjacent features

## The Evidence Rule

Every completion claim must include evidence:

```
Task [N] — [name]: COMPLETE
Evidence:
  Test run: [paste output or screenshot description]
  Manual check: [what you saw]
  Regression check: [N tests, all passing]
```

## If You Cannot Run Tests

If the test environment is broken or unavailable:
> "Cannot run verification — test environment issue: [reason].
> This is a blocker. The task is NOT marked complete until tests can run."

Do not mark work done. Fix the environment first.
