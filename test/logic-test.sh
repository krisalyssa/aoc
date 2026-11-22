#!/bin/bash

# Logic tests for shell script functionality

echo "=== Logic Tests ==="

# Test the argument validation logic by examining the scripts directly

echo "Testing aoc-test argument validation logic..."

# Check year validation
if grep -q "AOC_YEAR.*CURRENT_YEAR" "./bin/aoc-test"; then
    echo "✓ Year validation logic present in aoc-test"
else
    echo "✗ Year validation logic missing from aoc-test"
fi

if grep -q "2015.*CURRENT_YEAR" "./bin/aoc-test"; then
    echo "✓ Year range validation present in aoc-test"
else
    echo "✗ Year range validation missing from aoc-test"
fi

# Check day validation
if grep -q "AOC_DAY.*25" "./bin/aoc-test"; then
    echo "✓ Day range validation present in aoc-test"
else
    echo "✗ Day range validation missing from aoc-test"
fi

if grep -q "CURRENT_DAY" "./bin/aoc-test"; then
    echo "✓ Current day validation present in aoc-test"
else
    echo "✗ Current day validation missing from aoc-test"
fi

# Check language validation
if grep -q "AOC_LANG.*lang" "./bin/aoc-test"; then
    echo "✓ Language validation present in aoc-test"
else
    echo "✗ Language validation missing from aoc-test"
fi

echo -e "\nTesting aoc-verify argument validation logic..."

# Check year validation
if grep -q "AOC_YEAR.*CURRENT_YEAR" "./bin/aoc-verify"; then
    echo "✓ Year validation logic present in aoc-verify"
else
    echo "✗ Year validation logic missing from aoc-verify"
fi

if grep -q "2015.*CURRENT_YEAR" "./bin/aoc-verify"; then
    echo "✓ Year range validation present in aoc-verify"
else
    echo "✗ Year range validation missing from aoc-verify"
fi

# Check day validation
if grep -q "AOC_DAY.*25" "./bin/aoc-verify"; then
    echo "✓ Day range validation present in aoc-verify"
else
    echo "✗ Day range validation missing from aoc-verify"
fi

if grep -q "CURRENT_DAY" "./bin/aoc-verify"; then
    echo "✓ Current day validation present in aoc-verify"
else
    echo "✗ Current day validation missing from aoc-verify"
fi

# Check for solution verification logic
if grep -q "jq.*solutions.json" "./bin/aoc-verify"; then
    echo "✓ Solution verification logic present in aoc-verify"
else
    echo "✗ Solution verification logic missing from aoc-verify"
fi

echo -e "\nTesting utils.sh core functionality..."

# Check that all expected functions are defined
expected_functions=("run_cmd" "container_name" "container_exec" "container_run" "container_state")

for func in "${expected_functions[@]}"; do
    if grep -q "function ${func}\|^[[:space:]]*${func}[[:space:]]*()" "./bin/utils.sh"; then
        echo "✓ ${func} function defined in utils.sh"
    else
        echo "✗ ${func} function missing from utils.sh"
    fi
done

echo -e "\n=== Logic Test Summary ==="
echo "These tests verify that the scripts contain expected validation logic:"
echo "- Year range checking (2015 to current year)"
echo "- Day range checking (1-25)"
echo "- Current day validation for future dates"
echo "- Language directory validation"
echo "- Solution verification using jq"
echo "- Container management functions"