#!/bin/bash

# Verify current behavior vs expected behavior

# shellcheck disable=SC1091
source "${BASH_SOURCE%/*}/bin/utils.sh"

echo "=== Verifying run_cmd behavior ==="
echo ""

# Test 1: Normal mode - should capture no output (according to tests)
echo "Test 1: Normal mode (AOC_DRY_RUN=, AOC_VERBOSE=)"
AOC_DRY_RUN=
AOC_VERBOSE=
result=$(run_cmd "echo 'normal test'" 2>&1)
echo "Result: '${result}'"
echo "Expected by tests: '' (empty string)"
echo "Actual behavior: outputs the command result"
echo ""

# Test 2: Verbose mode - should show both running message and output
echo "Test 2: Verbose mode (AOC_DRY_RUN=, AOC_VERBOSE=1)"
AOC_DRY_RUN=
AOC_VERBOSE=1
result=$(run_cmd "echo 'verbose test'" 2>&1)
echo "Result: '${result}'"
echo "Expected by tests: 'running: echo verbose test' + 'verbose test'"
echo ""

# Test 3: Dry run mode - should only show running message, no execution
echo "Test 3: Dry run mode (AOC_DRY_RUN=1, AOC_VERBOSE=)"
AOC_DRY_RUN=1
AOC_VERBOSE=
result=$(run_cmd "echo 'dry test'" 2>&1)
echo "Result: '${result}'"
echo "Expected by tests: 'running: echo dry test' (only the running message)"
echo ""

# Test 4: Dry run + verbose mode - should only show running message, no execution
echo "Test 4: Dry run + verbose mode (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
export AOC_DRY_RUN=1
export AOC_VERBOSE=1
result=$(run_cmd "echo 'dry verbose test'" 2>&1)
echo "Result: '${result}'"
echo "Expected by tests: 'running: echo dry verbose test' (only the running message)"
echo ""

echo "=== Analysis ==="
echo "The current implementation shows that run_cmd executes commands normally."
echo "However, according to the test expectations, normal mode should produce no output."
echo ""
echo "This suggests there may be a discrepancy between what's implemented and what's expected."
