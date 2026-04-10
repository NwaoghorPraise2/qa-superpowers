# Changelog

## v1.1.0 — Multi-Platform Parity

Restructured the plugin to match the [obra/superpowers v5.0.7 standard](https://github.com/obra/superpowers). The plugin now works on all 5 supported platforms and injects session context via a hook on every session start.

### Platform Support Added
- **Cursor** — `.cursor-plugin/plugin.json` with skills, agents, commands, and hooks references
- **Codex** — `.codex/INSTALL.md` with git clone + symlink install guide
- **OpenCode** — `.opencode/INSTALL.md` with `opencode.json` plugin array guide
- **Gemini CLI** — `gemini-extension.json` + `GEMINI.md` with `@`-include for skill and tool mapping

### Structure
- Flattened `plugin/` subdirectory — skills and `CLAUDE.md` now live at repo root, matching the obra standard and Claude Code's auto-discovery conventions
- Removed non-standard `.claude-plugin/manifest.json` — Claude Code does not read this file
- Updated `.claude-plugin/plugin.json` and `marketplace.json` to the standard obra schema
- Added `AGENTS.md` (mirrors `CLAUDE.md`) for Codex compatibility

### Hooks
- Added `hooks/session-start` — bash script that reads `CLAUDE.md` and injects it wrapped in `<EXTREMELY_IMPORTANT>` tags on every session start, across Claude Code, Cursor, and Copilot CLI
- Added `hooks/hooks.json` (Claude Code), `hooks/hooks-cursor.json` (Cursor), `hooks/run-hook.cmd` (Windows/Unix polyglot launcher)

### Agents & Commands
- Added `agents/qa-reviewer.md` — QA reviewer agent for spec compliance and gate enforcement
- Added `commands/qa-review.md` and `commands/define-spec.md` — deprecated slash command stubs pointing to the canonical skills

### Tests
- Added `tests/hooks/test-session-start.sh` — 5-case TDD test suite for the session-start hook (valid JSON output, additionalContext key, EXTREMELY_IMPORTANT wrapper, CLAUDE.md content inclusion, graceful missing-file handling)

---

## v1.0.0 — Initial Release

### New Skills (QA-first additions)
- `session-init` — MEMORY.md session continuity
- `define-spec` — Formal spec with FRs and ACs
- `test-strategy` — Layered test coverage planning
- `write-tests` — Write and confirm failing tests before implementation
- `qa-review` — Full QA gate before merge

### Inherited and Upgraded from Superpowers
- `brainstorming` — Added QA gate with acceptance criteria requirement
- `writing-plans` — Added small-chunk enforcement (2–5 min per task) and test-first mandate
- `tdd-implement` — Added stuck protocol and MEMORY.md updates
- `executing-plans` — Added QA handoff at completion
- `subagent-driven-development` — Preserved with QA review integration
- `dispatching-parallel-agents` — Preserved with safety check emphasis
- `systematic-debugging` — Preserved from Superpowers
- `verification-before-completion` — Preserved from Superpowers
- `requesting-code-review` — Preserved with QA-first PR format
- `receiving-code-review` — Preserved from Superpowers
- `using-git-worktrees` — Added demo/production data protection note
- `finishing-a-development-branch` — Added QA pass pre-check
- `writing-skills` — Adapted for QA Superpowers contribution

### Infrastructure
- `CLAUDE.md` — Auto-loaded session rules and anti-patterns
- `MEMORY.md` template — Standardised session state format
- `.gitignore` — MEMORY.md excluded by default
