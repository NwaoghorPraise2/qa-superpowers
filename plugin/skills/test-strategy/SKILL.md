---
name: test-strategy
description: >
  Generates a layered test strategy from an approved spec. Defines what to test,
  at what level, with what tools, and in what priority order. Must run before
  write-tests. Triggers on: "test strategy", "what should we test", "how do we
  test this", or after define-spec completes.
---

# Skill: test-strategy

You are designing a test strategy. No tests are written yet — this is the plan for what to write.

## Pre-check

Confirm the spec exists. If not: "Please run `/define-spec` first."

## Step 1 — Testing Layers

Assess which layers apply to this feature. For each layer, state whether it applies and why:

### Layer 1: Unit Tests
- Scope: Individual functions, methods, classes in isolation
- When it applies: Any logic that can be tested without I/O, DB, or UI
- Tool: [Jest / pytest / RSpec / etc — infer from project]
- Priority: HIGH (fastest feedback loop)

### Layer 2: Integration Tests
- Scope: Multiple components working together, real DB calls, API routes
- When it applies: Any interaction between two or more modules
- Tool: [supertest / pytest with fixtures / etc]
- Priority: HIGH

### Layer 3: End-to-End Tests
- Scope: Full user journey through UI to DB and back
- When it applies: Critical user flows only (don't over-invest here)
- Tool: [Playwright / Cypress / etc]
- Priority: MEDIUM (slow, expensive — use sparingly)

### Layer 4: Manual / Exploratory Tests
- Scope: Edge cases, UX quality, unexpected user behaviour
- When it applies: Always — automated tests miss human judgment
- Format: Documented test scripts (written in write-tests skill)
- Priority: HIGH for acceptance, MEDIUM for regression

### Layer 5: Non-Functional Tests
- Performance, security, accessibility
- Only include if NFRs exist in the spec
- Priority: As defined in spec

## Step 2 — Coverage Map

For each Acceptance Criterion in the spec (AC-01, AC-02, etc.), assign test coverage:

```
AC-01: [criterion text]
  → Unit:       [what unit test covers this]
  → Integration:[what integration test covers this]
  → E2E:        [what E2E test covers this, or N/A]
  → Manual:     [what manual check covers this]
```

Present 3–4 ACs at a time. Get sign-off before continuing.

## Step 3 — Edge Case Register

List edge cases that need test coverage beyond the ACs:

```
EC-01: [edge case description]
  → Risk level: [high / medium / low]
  → Test type:  [unit / integration / manual]
  → Notes:      [why this is a risk]
```

## Step 4 — Test Priority Order

Define the order tests should be written:

```
Priority 1 (write first):    [list of ACs/ECs]  — highest risk / most critical
Priority 2 (write second):   [list of ACs/ECs]  — core happy path
Priority 3 (write last):     [list of ACs/ECs]  — edge cases / nice-to-have
```

## Step 5 — Save the Strategy

Save to:
```
docs/test-strategy/[feature-name]-test-strategy.md
```

## Step 6 — Update MEMORY.md

```
Stage: test-strategy ✅ → next: write-tests
Test strategy: docs/test-strategy/[feature-name]-test-strategy.md
Coverage map: [N] ACs covered, [M] edge cases registered
```

Then say:
> "Test strategy complete. [N] ACs mapped, [M] edge cases registered.
> Run `/write-tests` to begin writing test cases."

## QA Gate

- [ ] Every AC has test coverage assigned
- [ ] Edge cases registered and prioritised
- [ ] Test tools confirmed for this project
- [ ] Test priority order defined
- [ ] Strategy document saved
