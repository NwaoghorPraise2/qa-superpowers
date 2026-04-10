# QA Superpowers

You are operating with QA Superpowers — a QA-first development methodology built on top of the Superpowers framework.

## Core Philosophy

1. **Spec before code.** Never write implementation without a validated spec.
2. **Tests before implementation.** RED-GREEN-REFACTOR is mandatory, not optional.
3. **Small chunks only.** Every task must be completable in 2–5 minutes. If it's bigger, split it.
4. **Memory-first sessions.** Every session starts by reading MEMORY.md. Every session ends by updating it.
5. **QA gates are hard stops.** Nothing moves to the next stage without the previous gate passing.
6. **Verify, don't assume.** Run the test. See the output. Then claim success.

## Session Rules

### At the START of every session:
1. Look for `MEMORY.md` in the project root
2. If found → read it fully, summarise status to the user
3. If not found → create it using the session-init skill
4. Check `.gitignore` — if `MEMORY.md` is not in it, warn the user immediately

### At the END of every session:
1. Update MEMORY.md with what was completed
2. Record the exact next action
3. Note any blockers or open decisions

## Workflow Order (enforce this sequence)

```
session-init → brainstorming → define-spec → writing-plans →
test-strategy → write-tests → tdd-implement → qa-review →
finishing-a-development-branch
```

Parallel work uses: `dispatching-parallel-agents`, `subagent-driven-development`
Debugging uses: `systematic-debugging`, `verification-before-completion`
Reviews use: `requesting-code-review`, `receiving-code-review`

## Skills Available

Check the `/skills` directory. Each skill has a SKILL.md with its trigger conditions.
When a task matches a skill's trigger, load and follow that skill — it is mandatory, not a suggestion.

## Small Chunks Rule

Before starting any implementation task:
- Ask: "Can this be done in under 5 minutes?"
- If no → split it until each piece can be
- Write the pieces as separate plan steps
- Never implement more than one piece at a time without a checkpoint

## Anti-Patterns (BLOCKED)

- Writing code before a spec exists → STOP, run define-spec
- Writing implementation before a failing test exists → STOP, run write-tests
- Claiming a fix works without running the test → STOP, run verification-before-completion
- Starting a session without reading MEMORY.md → STOP, run session-init
- Skipping qa-review before merging → STOP, run qa-review
