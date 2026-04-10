# QA Superpowers

QA Superpowers is a complete, QA-first development workflow for your coding agents — built on top of [Superpowers](https://github.com/obra/superpowers) with full quality ownership layered in.

It starts from the moment you fire up your coding agent. Before a single line of code is written, it pulls a validated spec out of the conversation. After that, a test strategy is agreed on, failing tests are written, and only then does implementation begin — test by test, chunk by chunk.

Nothing skips a stage. Nothing merges without a QA gate passing. The agent doesn't suggest this workflow — it enforces it.

## How it works

```
Spec → Test Strategy → Failing Tests → TDD Implementation → QA Review → Merge
```

Every feature flows through this pipeline. The agent auto-loads the relevant skill at each stage. You don't need to invoke skills manually — they trigger on context.

## What's different from Superpowers

| Superpowers | QA Superpowers |
|---|---|
| Brainstorming → Plan → TDD → Review | Brainstorming → **Spec** → Plan → **Test Strategy** → **Write Tests (failing)** → TDD → **QA Review** → Merge |
| Plan files for context | **MEMORY.md** for full session continuity |
| Small tasks encouraged | Small tasks **enforced** (2–5 min hard limit) |
| Code review gate | **Full QA review gate** (spec compliance + coverage + quality + regression) |

## Installation

**Note:** Installation differs by platform. Claude Code and Cursor have built-in plugin marketplaces. Codex and OpenCode require manual setup.

### Claude Code (via Plugin Marketplace)

Register the marketplace, then install:

```bash
/plugin marketplace add NwaoghorPraise2/qa-superpowers
/plugin install qa-superpowers@qa-superpowers-dev
```

### Cursor (via Plugin Marketplace)

In Cursor Agent chat:

```text
/add-plugin qa-superpowers
```

### Codex

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/NwaoghorPraise2/qa-superpowers/main/.codex/INSTALL.md
```

### OpenCode

Tell OpenCode:

```
Fetch and follow instructions from https://raw.githubusercontent.com/NwaoghorPraise2/qa-superpowers/main/.opencode/INSTALL.md
```

### Gemini CLI

```bash
gemini extensions install https://github.com/NwaoghorPraise2/qa-superpowers
```

To update:

```bash
gemini extensions update qa-superpowers
```

### Verify Installation

Start a new session and ask: _"how does this work"_ — the `using-qa-superpowers` skill should load and walk you through the workflow.

## The Basic Workflow

1. **session-init** — Reads MEMORY.md from your project (or creates it). Surfaces what was done last session and what's next.

2. **brainstorming** — Activates before writing code. Refines the idea through questions, explores alternatives, presents design in sections for approval. Saves a design doc.

3. **define-spec** — Formalises the design into Functional Requirements and Acceptance Criteria. Nothing moves forward without a signed-off spec.

4. **using-git-worktrees** — Creates an isolated workspace on a new branch. Clean baseline, no risk to main.

5. **writing-plans** — Breaks work into 2–5 minute tasks. Every task includes exact file paths, complete code, and verification steps.

6. **test-strategy** — Plans the test layers: unit, integration, edge cases. Agreed upfront, not after implementation.

7. **write-tests** — Writes all the failing tests before any implementation code exists (TDD RED).

8. **tdd-implement** — RED-GREEN-REFACTOR per chunk. Subagent-driven with two-stage review after each task.

9. **qa-review** — Final gate. Checks spec compliance, test coverage, QA gate enforcement, and MEMORY.md. Nothing merges without this passing.

10. **finishing-a-development-branch** — Verifies tests, presents merge/PR/discard options, cleans up worktree.

**The agent checks for relevant skills before any task.** These are enforced workflows, not suggestions.

## The MEMORY.md Contract

Every project using this plugin maintains a `MEMORY.md` in its root:

```bash
echo "MEMORY.md" >> .gitignore   # always — it's session state, not source code
```

MEMORY.md is read at the start of every session and updated at the end. It's the single source of truth for project continuity across sessions.

## Skills

| Skill | Purpose |
|---|---|
| `session-init` | Load MEMORY.md, confirm .gitignore |
| `brainstorming` | Socratic design refinement |
| `define-spec` | Formal spec (FRs + ACs) |
| `writing-plans` | Bite-sized implementation tasks |
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

## Updating

Skills update automatically when you update the plugin:

```bash
/plugin update qa-superpowers
```

## Contributing

Skills live directly in this repository. To contribute:

1. Fork the repository
2. Create a branch for your skill or fix
3. Follow the `writing-skills` skill for creating and testing new skills
4. Submit a PR

See `skills/writing-skills/SKILL.md` for the complete guide.

## License

MIT — built by Nwaoghor Chukunweiken
