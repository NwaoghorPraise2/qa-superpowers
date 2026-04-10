---
name: session-init
description: >
  ALWAYS run at the start of every session. Reads MEMORY.md for context,
  surfaces current status, and identifies the next action. Triggers on:
  "start session", "where did we leave off", "what were we doing",
  "load context", "continue", or at the top of any new conversation
  where no context has been established yet.
---

# Skill: session-init

You are starting a working session. Do not write any code until this skill completes.

## Step 1 — MEMORY.md Check

Look for `MEMORY.md` in the project root.

**If it exists**, read the entire file then report to the user:

```
📋 SESSION CONTEXT
──────────────────
Project:      [name and one-line purpose]
Last worked:  [feature/task name]
Status:       [in-progress | blocked | ready-for-next-step | complete]
Completed:    [bullet list of what was done last session]
Next action:  [the single most important next step]
Blockers:     [any open decisions or blockers, or "None"]
```

**If it does NOT exist**, say:
> "No MEMORY.md found. This appears to be a new project or first session.
> Tell me in one paragraph what this project does, and I'll initialise the memory file."

After they respond, create MEMORY.md using the template in Step 4.

## Step 2 — .gitignore Check

Check whether `MEMORY.md` appears in `.gitignore`.

If it does NOT:
> ⚠️ **Action required now:** Add MEMORY.md to .gitignore before we proceed.
> It is session state, not source code. Run:
> ```
> echo "MEMORY.md" >> .gitignore
> ```

Do not proceed until the user confirms this is done or already was done.

## Step 3 — Confirm Today's Focus

Ask: **"What are we working on today?"**

- If they name something already in MEMORY.md → load that feature's context and confirm the current stage in the workflow
- If it's something new → confirm they want to start a new feature, then direct them to `/brainstorming` before any code

## Step 4 — MEMORY.md Template

When creating a new MEMORY.md:

```markdown
# MEMORY.md — [Project Name]
> ⚠️ Session state file. DO NOT COMMIT. Must be in .gitignore.

## Project Overview
[One paragraph describing what this product does and who it's for]

## Tech Stack
- Language/Runtime:
- Framework:
- Test framework:
- CI/CD:
- Database:

## Active Feature
**Name:** [feature name]
**Stage:** [brainstorming | spec | test-strategy | write-tests | tdd-implement | qa-review | done]
**Started:** [date]

## Session Log

### [Date] — Session N
**Completed:**
- [bullet: what was done]

**Next action:**
- [the single next step]

**Blockers:**
- [any open questions or blockers]

---
```

## Step 5 — Handoff

Once context is loaded, say:
> "Context loaded. Ready to continue. Next action: [next action from MEMORY.md]"

Then wait for the user's instruction before doing anything else.
