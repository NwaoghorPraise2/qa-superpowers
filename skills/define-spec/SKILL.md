---
name: define-spec
description: >
  Converts a brainstorming design document into a formal, validated feature spec.
  Must run before writing-plans or any test writing. Triggers on: "write the spec",
  "define the spec", "spec it out", after brainstorming completes, or when a feature
  needs formal documentation before development begins.
---

# Skill: define-spec

You are turning a design into a formal spec. Work in small sections. Get sign-off on each.

## Pre-check

Before starting, confirm:
- A design document exists at `docs/designs/[feature-name]-design.md`
- OR the user can paste/describe the agreed design

If neither exists, stop and say:
> "No design found. Please run `/brainstorming` first to agree on the design before writing a spec."

## Step 1 — Feature Identity (confirm before proceeding)

Present the following and ask the user to confirm or correct:

```
Feature Name:     [name]
Feature ID:       [FEAT-XXX or ticket number if known]
Product:          [product name]
Author:           [user's name if known]
Date:             [today's date]
Status:           DRAFT
```

## Step 2 — Problem Statement

Write one paragraph: what user problem this solves and why it matters.
Ask: "Is this accurate?"

## Step 3 — Scope (one section at a time, get sign-off on each)

**3a. In Scope**
Numbered list of exactly what this feature includes.

**3b. Out of Scope**
Numbered list of what is explicitly excluded.
(This is as important as what IS included — it prevents scope creep.)

**3c. Assumptions**
Numbered list of assumptions being made.
If an assumption is wrong, the spec is invalid — flag any risky ones.

## Step 4 — Functional Requirements

Write each requirement as:
```
FR-01: [The system SHALL / MUST / SHOULD] [do something] [when/given some condition]
```

Rules:
- Each requirement must be independently testable
- Use SHALL for mandatory, SHOULD for preferred, MAY for optional
- Aim for 5–15 requirements. If more, split into sub-features
- Present in groups of 3–5 and get sign-off before continuing

## Step 5 — Non-Functional Requirements

Cover relevant items from:
- Performance (e.g. "Response time SHALL be under 200ms")
- Security (e.g. "Input MUST be sanitised before DB write")
- Accessibility (e.g. "UI MUST meet WCAG 2.1 AA")
- Compatibility (browsers, OS, devices)
- Data integrity / backward compatibility

Only include what's relevant. Skip irrelevant categories.

## Step 6 — Acceptance Criteria

For each functional requirement, write an acceptance criterion:
```
AC-01 [maps to FR-01]: GIVEN [context], WHEN [action], THEN [expected outcome]
```

These are the direct source for test cases in the next stage.
Get explicit sign-off: "Do these criteria fully define done?"

## Step 7 — Save the Spec

Save to:
```
docs/specs/[feature-name]-spec.md
```

Full spec includes:
- Feature identity
- Problem statement
- Scope (in / out / assumptions)
- Functional requirements (FR-01..n)
- Non-functional requirements
- Acceptance criteria (AC-01..n)
- Sign-off section (who approved, date)

## Step 8 — Update MEMORY.md

Update the active feature stage in MEMORY.md:
```
Stage: spec ✅ → next: test-strategy
```

Then say:
> "Spec saved to docs/specs/[feature-name]-spec.md.
> Next step: run `/test-strategy` to generate the test plan."

## QA Gate

Before closing:
- [ ] All FRs independently testable
- [ ] All ACs in GIVEN/WHEN/THEN format
- [ ] Out-of-scope list exists
- [ ] Spec document saved
- [ ] MEMORY.md updated
