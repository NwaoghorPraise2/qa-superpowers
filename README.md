# QA Superpowers

> A QA-first development methodology for Claude Code.
> Built on top of [Superpowers](https://github.com/obra/superpowers) — with full QA ownership layered in.

## What It Does

QA Superpowers enforces a complete, disciplined development workflow where quality is built in from the start — not bolted on at the end.

Every feature flows through:

```
Spec → Test Strategy → Failing Tests → TDD Implementation → QA Review → Merge
```

Nothing skips a stage. Nothing merges without a QA gate passing.

## What's New vs Superpowers

| Superpowers | QA Superpowers |
|---|---|
| Brainstorming → Plan → TDD → Review | Brainstorming → **Spec** → Plan → **Test Strategy** → **Write Tests (failing)** → TDD → **QA Review** → Merge |
| Skills auto-load | Skills auto-load |
| Plan files for context | **MEMORY.md** for full session continuity |
| Small tasks encouraged | Small tasks **enforced** (2–5 min hard limit) |
| Code review gate | **Full QA review gate** (spec compliance + coverage + quality + regression) |

## Installation

### Via Claude Code Plugin Marketplace

```bash
/plugin marketplace add your-username/qa-superpowers-marketplace
/plugin install qa-superpowers@qa-superpowers-marketplace
```

### Manually (drop into project)

```bash
git clone https://github.com/your-username/qa-superpowers .claude/plugins/qa-superpowers
```

### Verify

Start a new Claude Code session and say: *"how does this work"* — the `using-qa-superpowers` skill should load.

## Quick Start

```bash
# 1. Start a session
/session-init

# 2. Design a new feature
/brainstorming

# 3. Write the spec
/define-spec

# 4. Create isolated workspace
/using-git-worktrees

# 5. Plan the implementation
/writing-plans

# 6. Plan the tests
/test-strategy

# 7. Write failing tests
/write-tests

# 8. Implement (TDD)
/tdd-implement

# 9. Final QA gate
/qa-review

# 10. Merge
/finishing-a-development-branch
```

## The MEMORY.md Contract

Every project using this plugin maintains a `MEMORY.md` in its root directory.

```
⚠️  Always add MEMORY.md to .gitignore immediately.
    It is session state, not source code.
    echo "MEMORY.md" >> .gitignore
```

MEMORY.md is:
- **Read** at the start of every session (via `session-init`)
- **Updated** at the end of every session with what was done and what's next
- The single source of truth for project continuity across sessions

## Skills

| Skill | Purpose |
|---|---|
| `session-init` | Load MEMORY.md, confirm .gitignore |
| `brainstorming` | Explore requirements before code |
| `define-spec` | Formal spec (FRs + ACs) |
| `writing-plans` | 2–5 min implementation tasks |
| `test-strategy` | Layered test coverage plan |
| `write-tests` | Write failing tests first |
| `tdd-implement` | RED-GREEN-REFACTOR per chunk |
| `executing-plans` | Batch execution with checkpoints |
| `subagent-driven-development` | Subagent dispatch with 2-stage review |
| `dispatching-parallel-agents` | Concurrent agents for independent tasks |
| `systematic-debugging` | 4-phase root cause process |
| `verification-before-completion` | Evidence-based completion |
| `requesting-code-review` | Pre-review checklist + PR format |
| `receiving-code-review` | Structured review response |
| `using-git-worktrees` | Isolated branch workspaces |
| `finishing-a-development-branch` | Merge / PR / close |
| `qa-review` | Final gate before merge |
| `writing-skills` | Author new skills |
| `using-qa-superpowers` | Orientation and workflow overview |

## Philosophy

- **Spec before code** — no implementation without validated requirements
- **Tests before implementation** — RED must come before GREEN
- **Small chunks** — 2–5 minute tasks, always
- **Memory between sessions** — MEMORY.md, always read, always updated
- **Evidence over claims** — verify before declaring done
- **QA is not a phase** — it's the entire workflow

## License

MIT — built by Automuss Technologies Ltd
