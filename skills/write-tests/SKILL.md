---
name: write-tests
description: >
  Writes automated and manual test cases from the test strategy and spec.
  Tests are written BEFORE implementation. Failing tests must be confirmed
  before implementation begins. Triggers on: "write tests", "write test cases",
  "create tests", or after test-strategy completes.
---

# Skill: write-tests

You are writing tests. No implementation code exists yet. That is correct and expected.
Tests must FAIL before implementation begins. A passing test before implementation means
the test is wrong or trivially vacuous.

## Pre-check

Confirm:
- Spec exists at `docs/specs/[feature-name]-spec.md`
- Test strategy exists at `docs/test-strategy/[feature-name]-test-strategy.md`

If either is missing, stop and direct the user to the appropriate prior skill.

## Step 1 — Work One AC at a Time

Take the first unwritten Acceptance Criterion from the strategy (Priority 1 first).

Say: "Writing tests for AC-01: [criterion text]. Here's what I'll write:"

Then present the test plan for THAT AC only:
- Unit test(s) needed
- Integration test(s) needed
- Manual test script (if applicable)

Get sign-off: "Does this cover AC-01 fully?" before writing code.

## Step 2 — Write Automated Tests

For each test, use this structure:

```
// Test file: [exact file path]
// AC: [AC number and text it covers]
// Type: [unit / integration / e2e]

describe('[feature name] — [AC short name]', () => {
  it('should [expected behaviour] when [condition]', () => {
    // Arrange
    [setup code]

    // Act
    [action code]

    // Assert
    [assertion — this should FAIL initially]
  });
});
```

Rules:
- One test per specific behaviour
- Tests must be independent (no shared state between tests)
- Use Arrange / Act / Assert structure
- Test names must read like documentation

## Step 3 — Confirm the Test FAILS

After writing each test, say:
> "Run this now and confirm it fails:
> `[exact test run command]`"

Wait for the user to confirm the test fails.

If the test passes without implementation:
> "⚠️ This test passed without implementation. That means it's not testing the right thing.
> Let's review it together."

Do not proceed to tdd-implement until the user confirms: "Test is failing."

## Step 4 — Write Manual Test Scripts

For each AC that requires manual verification, write a test script:

```markdown
### Manual Test: [AC number] — [name]
**Pre-conditions:** [what must be true before starting]
**Steps:**
1. [exact action]
2. [exact action]
3. [exact action]
**Expected result:** [what should happen]
**Pass/Fail criteria:** [how to know it passed]
**Notes:** [edge cases to check manually]
```

## Step 5 — Edge Case Tests

After all AC tests are written, add edge case tests from the EC register:
One at a time, same process — write, confirm it fails, proceed.

## Step 6 — Save Test Files

Tests are saved in the project's standard test directory.
Also save manual test scripts to:
```
docs/test-cases/[feature-name]-manual-tests.md
```

## Step 7 — Update MEMORY.md

```
Stage: write-tests ✅ → next: tdd-implement
Tests written: [N] automated, [M] manual scripts
All failing: [yes / no — list any that aren't]
```

Then say:
> "All tests written and confirmed failing. [N] automated tests, [M] manual scripts.
> Run `/tdd-implement` to begin implementation."

## QA Gate

- [ ] Every AC has at least one automated test
- [ ] Every test confirmed FAILING before implementation
- [ ] Manual test scripts written for non-automatable ACs
- [ ] Edge case tests written
- [ ] MEMORY.md updated
