#!/usr/bin/env bash
# TDD test for hooks/session-start

set -euo pipefail

PASS=0
FAIL=0
PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
HOOK="${PLUGIN_ROOT}/hooks/session-start"

TMPDIR_TEST="$(mktemp -d)"
trap "rm -rf ${TMPDIR_TEST}" EXIT

pass() { echo "PASS: $1"; PASS=$((PASS+1)); }
fail() { echo "FAIL: $1"; FAIL=$((FAIL+1)); }

# Create a known CLAUDE.md in temp dir
cat > "${TMPDIR_TEST}/CLAUDE.md" <<'MDEOF'
# QA Superpowers Test Content
This is test content for the session-start hook.
MDEOF

# Test 1: outputs valid JSON
output=$(CLAUDE_PLUGIN_ROOT="${TMPDIR_TEST}" "${HOOK}" 2>&1) || true
if echo "${output}" | jq . > /dev/null 2>&1; then
  pass "outputs valid JSON"
else
  fail "outputs valid JSON — got: ${output}"
fi

# Test 2: contains additionalContext key (any platform format)
context=$(echo "${output}" | jq -r '
  .additionalContext //
  .hookSpecificOutput.additionalContext //
  .additional_context //
  empty' 2>/dev/null) || context=""
if [ -n "${context}" ]; then
  pass "contains additionalContext key"
else
  fail "contains additionalContext key — got: ${output}"
fi

# Test 3: context contains EXTREMELY_IMPORTANT wrapper
if echo "${context}" | grep -q "EXTREMELY_IMPORTANT"; then
  pass "context contains EXTREMELY_IMPORTANT wrapper"
else
  fail "context contains EXTREMELY_IMPORTANT wrapper — got: ${context}"
fi

# Test 4: context includes CLAUDE.md content
if echo "${context}" | grep -q "QA Superpowers Test Content"; then
  pass "context includes CLAUDE.md content"
else
  fail "context includes CLAUDE.md content — got: ${context}"
fi

# Test 5: graceful missing CLAUDE.md (exits 0, still valid JSON)
output_missing=$(CLAUDE_PLUGIN_ROOT="${TMPDIR_TEST}/nonexistent" "${HOOK}" 2>&1) || true
exit_code=$?
if [ "${exit_code}" -eq 0 ] && echo "${output_missing}" | jq . > /dev/null 2>&1; then
  pass "graceful missing CLAUDE.md (exits 0, valid JSON)"
else
  fail "graceful missing CLAUDE.md — exit=${exit_code}, output=${output_missing}"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[ "${FAIL}" -eq 0 ]
