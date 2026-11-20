#!/bin/bash

# Comprehensive test runner for shell scripts in bin/

echo "Running unit tests for shell scripts..."

# Test utils.sh functions
echo "Testing utils.sh..."
if [[ -f "./test/test-utils.sh" ]]; then
    echo "  Running utils.sh tests..."
    bash ./test/test-utils.sh
else
    echo "  test-utils.sh test file not found"
fi

# Test aoc-test script
echo "Testing aoc-test..."
if [[ -f "./test-aoc-test.sh" ]]; then
    echo "  Running aoc-test tests..."
    bash ./test/test-aoc-test.sh
else
    echo "  aoc-test test file not found"
fi

# Test aoc-verify script
echo "Testing aoc-verify..."
if [[ -f "./test-aoc-verify.sh" ]]; then
    echo "  Running aoc-verify tests..."
    bash ./test/test-aoc-verify.sh
else
    echo "  aoc-verify test file not found"
fi

echo "All tests completed."