---
name: dispatching-parallel-agents
description: >
  Runs multiple independent tasks concurrently using parallel subagents.
  Only safe when tasks have no shared state or file dependencies. Triggers on:
  "do these in parallel", "run concurrently", "speed this up", or when 2+
  independent tasks could be done simultaneously.
---

# Skill: dispatching-parallel-agents

You are dispatching agents to work concurrently. Safety first — parallelism only where it's safe.

## Safety Check (mandatory)

Before dispatching any parallel agents, verify:

For every pair of tasks being parallelised:
- [ ] They do NOT write to the same file
- [ ] They do NOT share database state
- [ ] They do NOT depend on each other's output
- [ ] They do NOT both modify the same test fixture

If ANY pair fails a check → those tasks must run sequentially.

State: "Safe to parallelise: Tasks [A, B, C]. Must stay sequential: Tasks [D, E]."

## Dispatch Format

For each parallel agent, provide a complete, self-contained brief:

```
PARALLEL AGENT [N] — Task [X]: [name]
======================================
You are an independent agent. You have no knowledge of what other agents are doing.

Project context: [one paragraph]
Your specific task: [exact task from plan]
Files you may touch: [exhaustive list — do not modify anything not listed]
Tests to write first: [failing test description]
Verification command: [exact command]
Expected output: [exact expected result]
When done, report: [completion summary format]
```

## Coordination Rules

- Agents never share context with each other
- Each agent commits to its own branch or operates on clearly separated files
- You (the orchestrator) merge and review, never the agents

## Collecting Results

As agents complete, collect:

```
Agent [N] — Task [X]: [COMPLETE / FAILED / BLOCKED]
  Tests: [N passing]
  Commit: [hash]
  Issues: [any deviations or concerns]
```

## Merge Protocol

After all parallel agents complete:
1. Review each agent's output independently
2. Run full test suite after combining all work
3. Resolve any conflicts (should be none if safety check was done)
4. If conflicts exist → stop, diagnose, do not force-merge

## Update MEMORY.md

```
Stage: dispatching-parallel-agents ✅
Tasks parallelised: [N]
All passing: [yes / no]
```
