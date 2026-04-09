---
name: using-qa-superpowers
description: >
  Introduction to the QA Superpowers plugin. Explains the full workflow,
  available skills, and how they connect. Triggers on: "how does this work",
  "what skills do you have", "show me the workflow", "what is qa superpowers",
  or at the start of any project where the user is unfamiliar with the system.
---

# Skill: using-qa-superpowers

Welcome to QA Superpowers — a QA-first development methodology built on the Superpowers framework.

## The Core Philosophy

**Spec before code. Tests before implementation. Small chunks. Memory between sessions.**

Nothing moves forward without the previous gate passing. This isn't suggestions — it's how we work.

## The Full Workflow

```
┌─────────────────────────────────────────────────────────┐
│                    EVERY SESSION                        │
│  /session-init — read MEMORY.md, confirm .gitignore     │
└───────────────────────┬─────────────────────────────────┘
                        │
              NEW FEATURE WORKFLOW
                        │
          /brainstorming ──► /define-spec
                        │
                /using-git-worktrees
                        │
              /writing-plans ──► /test-strategy
                        │
                  /write-tests
                  (confirm failing)
                        │
                /tdd-implement ─────────────────────────┐
                (RED-GREEN-REFACTOR per task)            │
                        │                               │
              [task complete?]                    /systematic-debugging
                  │       │                      /verification-before-completion
                 yes      no ───────────────────┘
                  │
        [more tasks?]
            │       │
           yes      no
            │        │
     back to         /qa-review ──► FAIL ─► back to tdd-implement
   tdd-implement          │
                         PASS
                          │
             /requesting-code-review (optional)
                          │
             /finishing-a-development-branch
```

## All Available Skills

### Session Management
| Skill | Purpose |
|---|---|
| `session-init` | Load MEMORY.md, confirm context, .gitignore check |

### Feature Design
| Skill | Purpose |
|---|---|
| `brainstorming` | Explore requirements before any code |
| `define-spec` | Formal spec with FRs and ACs |

### Planning
| Skill | Purpose |
|---|---|
| `writing-plans` | Chunk-by-chunk implementation plan (2–5 min tasks) |
| `test-strategy` | Layered test coverage plan |

### QA (Core — unique to this plugin)
| Skill | Purpose |
|---|---|
| `write-tests` | Write failing tests before implementation |
| `tdd-implement` | RED-GREEN-REFACTOR, one chunk at a time |
| `qa-review` | Final gate before merge — spec, coverage, quality |

### Execution
| Skill | Purpose |
|---|---|
| `executing-plans` | Batch plan execution with checkpoints |
| `subagent-driven-development` | Dispatch subagents for large plans |
| `dispatching-parallel-agents` | Concurrent agents for independent tasks |

### Debugging
| Skill | Purpose |
|---|---|
| `systematic-debugging` | 4-phase root cause process |
| `verification-before-completion` | Evidence-based completion check |

### Collaboration
| Skill | Purpose |
|---|---|
| `requesting-code-review` | Pre-review checklist + PR description |
| `receiving-code-review` | Structured response to review feedback |

### Git
| Skill | Purpose |
|---|---|
| `using-git-worktrees` | Isolated branch workspaces |
| `finishing-a-development-branch` | Merge / PR / close workflow |

### Meta
| Skill | Purpose |
|---|---|
| `writing-skills` | Author new skills for this plugin |

## The MEMORY.md Contract

- Every project has a `MEMORY.md` in its root
- **Always in `.gitignore`** — it is session state, not code
- Read at session start via `session-init`
- Updated at session end (stage, completed, next action, blockers)
- The source of truth for what's been done and what's next

## The Small Chunks Rule

Every implementation task must be completable in **2–5 minutes**.
If a task would take longer → split it.
This is non-negotiable. Large tasks cause context loss, missed edge cases, and messy commits.

## Anti-Patterns This Plugin Blocks

| Anti-pattern | What happens |
|---|---|
| Code without a spec | STOP → `/brainstorming` then `/define-spec` |
| Implementation without a failing test | STOP → `/write-tests` |
| "I think it works" without running tests | STOP → `/verification-before-completion` |
| Session without reading MEMORY.md | STOP → `/session-init` |
| Merging without QA review | STOP → `/qa-review` |
| Tasks bigger than 5 minutes | STOP → split the task |
