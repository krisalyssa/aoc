#!/bin/bash

# Direct test of run_cmd function behavior

# Source the utils.sh file
# shellcheck disable=SC1091
source "${BASH_SOURCE%/*}/bin/utils.sh"

echo "=== Direct run_cmd Function Test ==="

# Test 1: Normal execution (no flags)
echo "Test 1: Normal execution (AOC_DRY_RUN=, AOC_VERBOSE=)"
export AOC_DRY_RUN=
export AOC_VERBOSE=

echo "Running: echo 'normal test'"
result=$(run_cmd "echo 'normal test'" 2>&1)
echo "Result: '${result}'"
echo "Expected: '' (empty output in non-verbose mode)"
echo ""

# Test 2: Verbose execution
echo "Test 2: Verbose execution (AOC_DRY_RUN=, AOC_VERBOSE=1)"
export AOC_DRY_RUN=
export AOC_VERBOSE=1

echo "Running: echo 'verbose test'"
result=$(run_cmd "echo 'verbose test'" 2>&1)
echo "Result: '${result}'"
echo "Expected: 'verbose test' (output shown in verbose mode)"
echo ""

# Test 3: Dry run execution
echo "Test 3: Dry run execution (AOC_DRY_RUN=1, AOC_VERBOSE=)"
export AOC_DRY_RUN=1
export AOC_VERBOSE=
AOC_VERBOSE=

echo "Running: echo 'dry run test'"
result=$(run_cmd "echo 'dry run test'" 2>&1)
echo "Result: '${result}'"
echo "Expected: '' (empty output in dry run mode)"
echo ""

# Test 4: Dry run with verbose
echo "Test 4: Dry run with verbose (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
export AOC_DRY_RUN=1
export AOC_VERBOSE=1

echo "Running: echo 'dry run verbose test'"
result=$(run_cmd "echo 'dry run verbose test'" 2>&1)
echo "Result: '${result}'"
echo "Expected: '' (empty output even in verbose mode when dry run is enabled)"
echo ""

# Test 5: Complex command
echo "Test 5: Complex command execution"
AOC_DRY_RUN=
AOC_VERBOSE=1

echo "Running: date +%Y"
result=$(run_cmd "date +%Y" 2>&1)
echo "Result: '${result}'"
echo "Expected: Current year (output shown in verbose mode)"
echo ""

echo "=== Direct Test Complete ==="
