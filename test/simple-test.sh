#!/bin/bash

# Simple unit test for shell scripts in bin/

echo "=== Unit Tests for Shell Scripts ==="

# Test 1: Check if scripts exist
echo "Test 1: Checking script existence..."
if [[ -f "./bin/aoc-test" ]]; then
    echo "✓ aoc-test exists"
else
    echo "✗ aoc-test missing"
fi

if [[ -f "./bin/aoc-verify" ]]; then
    echo "✓ aoc-verify exists"
else
    echo "✗ aoc-verify missing"
fi

if [[ -f "./bin/utils.sh" ]]; then
    echo "✓ utils.sh exists"
else
    echo "✗ utils.sh missing"
fi

# Test 2: Check script permissions
echo -e "\nTest 2: Checking script permissions..."
if [[ -x "./bin/aoc-test" ]]; then
    echo "✓ aoc-test is executable"
else
    echo "✗ aoc-test not executable"
fi

if [[ -x "./bin/aoc-verify" ]]; then
    echo "✓ aoc-verify is executable"
else
    echo "✗ aoc-verify not executable"
fi

# Test 3: Check basic syntax
echo -e "\nTest 3: Checking script syntax..."
if bash -n "./bin/aoc-test" 2>/dev/null; then
    echo "✓ aoc-test has valid syntax"
else
    echo "✗ aoc-test has syntax errors"
fi

if bash -n "./bin/aoc-verify" 2>/dev/null; then
    echo "✓ aoc-verify has valid syntax"
else
    echo "✗ aoc-verify has syntax errors"
fi

if bash -n "./bin/utils.sh" 2>/dev/null; then
    echo "✓ utils.sh has valid syntax"
else
    echo "✗ utils.sh has syntax errors"
fi

# Test 4: Check for key functions in utils.sh
echo -e "\nTest 4: Checking utils.sh functions..."
functions_to_check=("run_cmd" "container_name" "container_exec" "container_run" "container_state")
for func in "${functions_to_check[@]}"; do
    if grep -q "function $func\|^[[:space:]]*$func[[:space:]]*()" "./bin/utils.sh"; then
        echo "✓ $func function exists"
    else
        echo "✗ $func function missing"
    fi
done

# Test 5: Check for key patterns in aoc-test
echo -e "\nTest 5: Checking aoc-test structure..."
patterns_to_check=("getopts" "AOC_LANG" "AOC_YEAR" "AOC_DAY" "container_state")
for pattern in "${patterns_to_check[@]}"; do
    if grep -q "$pattern" "./bin/aoc-test"; then
        echo "✓ $pattern found in aoc-test"
    else
        echo "✗ $pattern not found in aoc-test"
    fi
done

# Test 6: Check for key patterns in aoc-verify
echo -e "\nTest 6: Checking aoc-verify structure..."
patterns_to_check=("getopts" "AOC_LANG" "AOC_YEAR" "AOC_DAY" "jq")
for pattern in "${patterns_to_check[@]}"; do
    if grep -q "$pattern" "./bin/aoc-verify"; then
        echo "✓ $pattern found in aoc-verify"
    else
        echo "✗ $pattern not found in aoc-verify"
    fi
done

echo -e "\n=== Test Summary ==="
echo "These tests verify that the shell scripts exist, are executable, have valid syntax,"
echo "and contain the expected functions and patterns. For more comprehensive testing,"
echo "integration tests with mock containers would be needed."