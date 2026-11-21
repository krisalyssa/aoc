#!/bin/bash

# Clear test of run_cmd function behavior

# Source the utils.sh file
source "${BASH_SOURCE%/*}/bin/utils.sh"

echo "=== Clear run_cmd Function Test ==="

# Test 1: Normal execution (no flags) - should produce no output to stdout
echo "Test 1: Normal execution (AOC_DRY_RUN=, AOC_VERBOSE=)"
AOC_DRY_RUN=
AOC_VERBOSE=

echo "Running: echo 'normal test'"
result=$(run_cmd "echo 'normal test'" 2>&1)
echo "Result (captured output): '$result'"
echo "Expected: '' (empty - no stdout output in normal mode)"
echo ""

# Test 2: Verbose execution - should show command and produce output
echo "Test 2: Verbose execution (AOC_DRY_RUN=, AOC_VERBOSE=1)"
AOC_DRY_RUN=
AOC_VERBOSE=1

echo "Running: echo 'verbose test'"
result=$(run_cmd "echo 'verbose test'" 2>&1)
echo "Result (captured output): '$result'"
echo "Expected: 'running: echo 'verbose test'' + 'verbose test' (both shown in verbose mode)"
echo ""

# Test 3: Dry run execution - should only show command but not execute
echo "Test 3: Dry run execution (AOC_DRY_RUN=1, AOC_VERBOSE=)"
AOC_DRY_RUN=1
AOC_VERBOSE=

echo "Running: echo 'dry run test'"
result=$(run_cmd "echo 'dry run test'" 2>&1)
echo "Result (captured output): '$result'"
echo "Expected: '' (empty - no execution in dry run mode)"
echo ""

# Test 4: Dry run with verbose - should only show command but not execute
echo "Test 4: Dry run with verbose (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
AOC_DRY_RUN=1
AOC_VERBOSE=1

echo "Running: echo 'dry run verbose test'"
result=$(run_cmd "echo 'dry run verbose test'" 2>&1)
echo "Result (captured output): '$result'"
echo "Expected: 'running: echo 'dry run verbose test'' (only command shown, no execution)"
echo ""

echo "=== Test Complete ==="