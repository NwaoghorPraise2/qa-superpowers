# Design: Multi-Platform Parity with obra/superpowers Standard

**Date:** 2026-04-10  
**Status:** Approved

---

## Goal

Bring `qa-superpowers` up to the `obra/superpowers` v5.0.7 standard. The plugin should be installable and functional on all 5 platforms: Claude Code, Cursor, Codex, OpenCode, and Gemini CLI.

---

## Current Problems

1. Skills are at `plugin/skills/` — Claude Code auto-discovers `skills/` at plugin root only.
2. `CLAUDE.md` is at `plugin/CLAUDE.md` — Claude Code reads `CLAUDE.md` at plugin root.
3. `.claude-plugin/manifest.json` exists with non-standard fields (`skills_dir`, `entry`, `hooks_dir`) — Claude Code does not read this file; it causes confusion.
4. `plugin/.claude-plugin/plugin.json` duplicates the root `.claude-plugin/plugin.json`.
5. No Cursor, Codex, OpenCode, or Gemini support.
6. No hooks — session context is not forcefully injected on start.
7. No `agents/` or `commands/` directories.
8. No tests for any scripts.

---

## Architecture

### Plugin Root Convention

Claude Code (and the other platforms) discover plugin assets by convention from the plugin root — the directory containing `.claude-plugin/`. That root must be the repo root, not a subdirectory. All assets must be at top level:

```
repo root/
  .claude-plugin/    ← plugin metadata
  skills/            ← auto-discovered by Claude Code
  hooks/hooks.json   ← auto-discovered by Claude Code
  CLAUDE.md          ← auto-injected by Claude Code
```

### Context Injection Strategy

`CLAUDE.md` at the plugin root is used as plugin context (QA instructions), not contributor guidelines. This is intentional — it departs from obra's pattern but is valid for a standalone plugin.

The `hooks/session-start` script re-injects `CLAUDE.md` content wrapped in `<EXTREMELY_IMPORTANT>` tags at session start. This provides forceful injection for platforms that do not natively read CLAUDE.md (Cursor, Codex, OpenCode).

---

## File Changes

### Delete
- `plugin/` — entire directory (skills, CLAUDE.md, nested .claude-plugin/)
- `.claude-plugin/manifest.json` — non-standard, unused by Claude Code

### Move
- `plugin/CLAUDE.md` → `CLAUDE.md`
- `plugin/skills/*` → `skills/*` (all 20 skills, internal structure unchanged)

### Update

**`.claude-plugin/plugin.json`** — strip to standard obra format:
```json
{
  "name": "qa-superpowers",
  "description": "QA-first development methodology. Spec → Tests → TDD → QA Review.",
  "version": "1.0.0",
  "author": { "name": "Nwaoghor Chukunweiken", "email": "support@automusstech.com" },
  "homepage": "https://github.com/NwaoghorPraise2/qa-superpowers",
  "repository": "https://github.com/NwaoghorPraise2/qa-superpowers",
  "license": "MIT",
  "keywords": ["qa", "tdd", "testing", "spec", "methodology"]
}
```

**`.claude-plugin/marketplace.json`** — update source to local `"./"` (dev marketplace):
```json
{
  "name": "qa-superpowers-dev",
  "description": "Development marketplace for QA Superpowers plugin",
  "owner": { "name": "Nwaoghor Chukunweiken", "email": "support@automusstech.com" },
  "plugins": [{
    "name": "qa-superpowers",
    "description": "QA-first development methodology. Spec → Tests → TDD → QA Review.",
    "version": "1.0.0",
    "source": "./",
    "author": { "name": "Nwaoghor Chukunweiken", "email": "support@automusstech.com" }
  }]
}
```

### Create

**`.cursor-plugin/plugin.json`** — Cursor metadata:
```json
{
  "name": "qa-superpowers",
  "displayName": "QA Superpowers",
  "description": "QA-first development methodology. Spec → Tests → TDD → QA Review.",
  "version": "1.0.0",
  "author": { "name": "Nwaoghor Chukunweiken", "email": "support@automusstech.com" },
  "homepage": "https://github.com/NwaoghorPraise2/qa-superpowers",
  "repository": "https://github.com/NwaoghorPraise2/qa-superpowers",
  "license": "MIT",
  "keywords": ["qa", "tdd", "testing", "spec", "methodology"],
  "skills": "./skills/",
  "agents": "./agents/",
  "commands": "./commands/",
  "hooks": "./hooks/hooks-cursor.json"
}
```

**`.codex/INSTALL.md`** — Codex installation guide (git clone + symlink pattern).

**`.opencode/INSTALL.md`** — OpenCode installation guide (opencode.json plugin array pattern).

**`gemini-extension.json`**:
```json
{
  "name": "qa-superpowers",
  "description": "QA-first development methodology. Spec → Tests → TDD → QA Review.",
  "version": "1.0.0",
  "contextFileName": "GEMINI.md"
}
```

**`AGENTS.md`** — identical content to `CLAUDE.md` (Codex reads AGENTS.md).

**`GEMINI.md`**:
```
@./skills/using-qa-superpowers/SKILL.md
@./skills/using-qa-superpowers/references/gemini-tools.md
```

**`skills/using-qa-superpowers/references/gemini-tools.md`** — Gemini CLI tool mapping table (adapted from obra's version).

**`agents/qa-reviewer.md`** — QA reviewer agent: reviews completed work against spec and QA gates.

**`commands/qa-review.md`** — `/qa-review` slash command: deprecated wrapper pointing to `qa-superpowers:qa-review` skill.

**`commands/define-spec.md`** — `/define-spec` slash command: deprecated wrapper pointing to `qa-superpowers:define-spec` skill.

**`hooks/hooks.json`** — Claude Code SessionStart hook:
```json
{
  "hooks": {
    "SessionStart": [{
      "matcher": "startup|clear|compact",
      "hooks": [{
        "type": "command",
        "command": "\"${CLAUDE_PLUGIN_ROOT}/hooks/run-hook.cmd\" session-start",
        "async": false
      }]
    }]
  }
}
```

**`hooks/hooks-cursor.json`** — Cursor sessionStart hook:
```json
{
  "version": 1,
  "hooks": {
    "sessionStart": [{ "command": "./hooks/session-start" }]
  }
}
```

**`hooks/run-hook.cmd`** — Windows/Unix polyglot bash launcher (copied verbatim from obra v5.0.7).

**`hooks/session-start`** — bash script that reads `CLAUDE.md` from plugin root, escapes it for JSON, and outputs `additionalContext` wrapped in `<EXTREMELY_IMPORTANT>` tags. Adapted from obra's script (references `CLAUDE.md` instead of `skills/using-superpowers/SKILL.md`).

---

## Tests

**`tests/hooks/test-session-start.sh`** — TDD test for `hooks/session-start`:

Test cases (written before the script is implemented):
1. **outputs valid JSON** — `jq .` parses output without error
2. **contains additionalContext key** — `jq '.additionalContext'` returns non-null
3. **context contains EXTREMELY_IMPORTANT wrapper** — output includes `<EXTREMELY_IMPORTANT>`
4. **context includes CLAUDE.md content** — output includes a known string from CLAUDE.md
5. **graceful missing CLAUDE.md** — when CLAUDE.md absent, outputs JSON with error string (no crash, exit 0)

The test script sets `CLAUDE_PLUGIN_ROOT` to a temp directory, places a known `CLAUDE.md` there, runs `hooks/session-start`, and asserts against the output.

---

## Platform Summary

| Platform | Mechanism | File |
|---|---|---|
| Claude Code | Auto-reads `CLAUDE.md` + hooks | `hooks/hooks.json` |
| Cursor | `sessionStart` hook | `hooks/hooks-cursor.json` via `.cursor-plugin/plugin.json` |
| Codex | Git clone + symlink | `.codex/INSTALL.md` |
| OpenCode | `opencode.json` plugin array | `.opencode/INSTALL.md` |
| Gemini CLI | `GEMINI.md` `@`-include | `gemini-extension.json` |

---

## Out of Scope

- Modifying skill content (skills are moved, not changed)
- Adding new QA skills
- Publishing to a public marketplace
- Adding `tests/` beyond the hook test
