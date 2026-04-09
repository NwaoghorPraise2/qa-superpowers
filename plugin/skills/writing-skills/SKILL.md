---
name: writing-skills
description: >
  Teaches how to author, test, and contribute new skills to this plugin.
  Triggers on: "write a new skill", "add a skill", "I want to create a skill",
  or when a workflow pattern needs to be captured and reused.
---

# Skill: writing-skills

You are writing a new skill. A skill is a reusable workflow document that Claude
loads and follows automatically when conditions match.

## What Makes a Good Skill

A good skill:
- Solves a specific, recurring workflow problem
- Has clear trigger conditions (when should this load?)
- Breaks work into sequential, verifiable steps
- Has explicit gates that block progression without evidence
- Is generic enough to work across projects
- Is specific enough to actually change behaviour

A bad skill:
- Is vague advice ("be systematic")
- Has no checkpoints or gates
- Assumes context that may not exist
- Tries to do too many things at once

## Step 1 — Define the Skill

Answer before writing anything:

1. **What problem does this skill solve?** One sentence.
2. **When should it trigger?** List 3–5 specific trigger phrases.
3. **What does it block?** What anti-pattern does it prevent?
4. **What is the output?** What does the user have at the end?
5. **What are the gates?** Where can work NOT proceed without evidence?

## Step 2 — Skill File Structure

Every skill lives in its own folder under `skills/`:
```
skills/[skill-name]/SKILL.md
```

The SKILL.md format:

```markdown
---
name: skill-name
description: >
  One paragraph. First sentence: what it does.
  Second sentence: when it triggers.
  Third sentence: specific trigger phrases.
---

# Skill: [Skill Name]

[One sentence: the non-negotiable rule this skill enforces]

## Pre-check
[What must exist or be true before this skill can run]

## Step 1 — [Name]
[Instructions. Be specific. Include exact commands.]

## Step 2 — [Name]
[...]

## QA Gate
- [ ] [Verifiable checkbox]
- [ ] [Verifiable checkbox]
```

## Step 3 — Test the Skill

Before submitting, test it:

1. **Trigger test** — Does the skill load when you use the trigger phrases?
2. **Flow test** — Work through the skill end-to-end on a real or simulated task
3. **Gate test** — Try to skip a gate. Does the skill block you?
4. **Edge case test** — What if pre-conditions aren't met? Does it fail gracefully?

Document test results:
```
Trigger test: PASS / FAIL
Flow test: PASS / FAIL — [any issues]
Gate test: PASS / FAIL — [confirmed blocked on: X]
Edge case: PASS / FAIL — [behaviour when pre-check fails]
```

## Step 4 — Integrate the Skill

Add a reference to the new skill in `CLAUDE.md` if it should be part of the main workflow.

Update `skills/using-qa-superpowers/SKILL.md` to include it in the skills list.

## Step 5 — Naming Conventions

- Folder names: `kebab-case`
- Skill names in frontmatter: `kebab-case`
- Step headers: `## Step N — Descriptive Name`
- Gate items: `- [ ] Past tense verifiable action`

## Contribution

To add this skill to the plugin repository:
1. Fork the repo
2. Add your skill folder under `skills/`
3. Test it thoroughly
4. Submit a PR with your test results in the description
