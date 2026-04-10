---
name: brainstorming
description: >
  Activates before writing any code or spec. Explores user intent, requirements,
  and design through Socratic questioning. Saves a design document and hands off
  to define-spec. Triggers on: "I want to build", "new feature", "help me think
  through", "let's design", or any request to implement something new before a
  spec exists.
---

# Skill: brainstorming

Do not write code. Do not write tests. Do not write a spec yet.
Your job is to draw out the full picture through questions.

## Phase 1 — Understand the Problem (max 5 questions, one at a time)

Ask these questions one at a time. Wait for each answer before asking the next.

1. **What problem does this solve?** Describe it in one sentence from the user's perspective.
2. **Who uses this?** What do they want to accomplish?
3. **What does success look like?** How will you know it's working?
4. **What are the boundaries?** What is explicitly OUT of scope?
5. **What could go wrong?** What are the riskiest assumptions?

After each answer, reflect back what you heard in one sentence to confirm understanding.

## Phase 2 — Explore Alternatives

Before committing to an approach, present 2–3 alternative designs:

```
Option A: [name] — [one line description]
  Pros: [2–3 bullet points]
  Cons: [2–3 bullet points]

Option B: [name] — [one line description]
  Pros: [2–3 bullet points]
  Cons: [2–3 bullet points]

Option C: [name] — [one line description]
  Pros: [2–3 bullet points]
  Cons: [2–3 bullet points]
```

Ask: "Which direction feels right, or should we combine elements?"

## Phase 3 — Present Design in Sections

Break the chosen design into sections. Present **one section at a time** and ask for sign-off before continuing.

Section structure:
1. **Core behaviour** — what it does in plain English
2. **User flow** — step-by-step what the user experiences
3. **Data model / state** — what data is created, read, updated, deleted
4. **Edge cases** — what happens when things go wrong
5. **Acceptance criteria** — bullet list of "done" conditions (these become test cases)

For each section: present it, ask "Does this look right?", then proceed only after confirmation.

## Phase 4 — Save Design Document

Save the agreed design to a file:
```
docs/designs/[feature-name]-design.md
```

Contents:
- Problem statement
- Chosen approach (with rationale)
- User flow
- Data model
- Edge cases
- Acceptance criteria (numbered list)

Then say:
> "Design complete and saved to docs/designs/[feature-name]-design.md.
> Ready to move to spec definition. Run `/define-spec` to continue."

## QA Gate

Before closing this skill, confirm:
- [ ] Problem statement agreed
- [ ] Approach chosen and rationale documented
- [ ] Acceptance criteria listed (numbered)
- [ ] Design document saved
- [ ] User has approved all sections

**Do not proceed to define-spec without all checkboxes confirmed.**
