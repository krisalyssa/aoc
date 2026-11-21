#!/bin/bash

# Test what run_cmd SHOULD do according to typical expectations

echo "=== Testing Expected vs Actual run_cmd Behavior ==="

echo ""
echo "The fundamental question:"
echo "What should run_cmd return when called?"

echo ""
echo "Current behavior analysis:"
echo "1. Normal mode: Command executes and produces stdout"
echo "2. Verbose mode: Shows 'running: command' + command stdout"

echo ""
echo "What the tests expect:"
echo "1. Normal mode: Should produce NO output (to allow clean capture of command results)"
echo "2. Verbose mode: Should show 'running: command' + command stdout"

echo ""
echo "PROBLEM: The current implementation doesn't distinguish between these cases."
echo "When AOC_VERBOSE is not set, we still see command output in normal mode."

echo ""
echo "CORRECT APPROACH:"
echo "In normal mode, run_cmd should execute the command but suppress its stdout."
echo "This allows calling code to capture clean command results without interference."
echo "Only stderr (the 'running:' message) should be visible when verbose is enabled."

echo ""
echo "Example:"
echo "If run_cmd executes 'echo \"result\"':"
echo "- Normal mode: returns 'result' (command output only)"
echo "- Verbose mode: shows 'running: echo \"result\"' + returns 'result'"

source "./bin/utils.sh"

echo ""
echo "=== Current Actual Behavior ==="
AOC_DRY_RUN=
AOC_VERBOSE=

echo "Normal mode test:"
result=$(run_cmd "echo 'test'" 2>&1)
echo "Result: '$result'"
echo "Expected: 'test' (but this is wrong for tests)"

echo ""
AOC_VERBOSE=1
echo "Verbose mode test:"
result=$(run_cmd "echo 'test'" 2>&1)
echo "Result: '$result'"
echo "Expected: 'running: echo 'test'' + 'test'"