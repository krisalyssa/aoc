#!/bin/bash

# Complete test suite for shell scripts in bin/

echo "=============================================="
echo "         COMPLETE TEST SUITE FOR AOC SCRIPTS"
echo "=============================================="

# Set up environment
export AOC_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export AOC_VERBOSE=
export AOC_DRY_RUN=

echo "Testing environment: $AOC_ROOT"
echo

# Test 1: Basic script existence and permissions
echo "1. Testing script existence and permissions..."
if [[ -f "./bin/aoc-test" ]] && [[ -x "./bin/aoc-test" ]]; then
    echo "   ✓ aoc-test exists and is executable"
else
    echo "   ✗ aoc-test missing or not executable"
    exit 1
fi

if [[ -f "./bin/aoc-verify" ]] && [[ -x "./bin/aoc-verify" ]]; then
    echo "   ✓ aoc-verify exists and is executable"
else
    echo "   ✗ aoc-verify missing or not executable"
    exit 1
fi

if [[ -f "./bin/utils.sh" ]]; then
    echo "   ✓ utils.sh exists"
else
    echo "   ✗ utils.sh missing"
    exit 1
fi

# Test 2: Syntax validation
echo "2. Testing script syntax..."
if bash -n "./bin/aoc-test" 2>/dev/null; then
    echo "   ✓ aoc-test has valid syntax"
else
    echo "   ✗ aoc-test has syntax errors"
    exit 1
fi

if bash -n "./bin/aoc-verify" 2>/dev/null; then
    echo "   ✓ aoc-verify has valid syntax"
else
    echo "   ✗ aoc-verify has syntax errors"
    exit 1
fi

if bash -n "./bin/utils.sh" 2>/dev/null; then
    echo "   ✓ utils.sh has valid syntax"
else
    echo "   ✗ utils.sh has syntax errors"
    exit 1
fi

# Test 3: Core functionality tests
echo "3. Testing core functionality..."

# Source utils.sh to test its functions
source "./bin/utils.sh"

# Test container_name function
result=$(container_name "2023" "bash")
if [[ "$result" == "aoc-bash-2023" ]]; then
    echo "   ✓ container_name function works correctly"
else
    echo "   ✗ container_name function failed: expected 'aoc-bash-2023', got '$result'"
    exit 1
fi

# Test that scripts source utils.sh
if grep -q "source.*utils.sh" "./bin/aoc-test"; then
    echo "   ✓ aoc-test sources utils.sh"
else
    echo "   ✗ aoc-test does not source utils.sh"
    exit 1
fi

if grep -q "source.*utils.sh" "./bin/aoc-verify"; then
    echo "   ✓ aoc-verify sources utils.sh"
else
    echo "   ✗ aoc-verify does not source utils.sh"
    exit 1
fi

# Test argument parsing
if grep -q "getopts" "./bin/aoc-test"; then
    echo "   ✓ aoc-test uses getopts for argument parsing"
else
    echo "   ✗ aoc-test does not use getopts"
    exit 1
fi

if grep -q "getopts" "./bin/aoc-verify"; then
    echo "   ✓ aoc-verify uses getopts for argument parsing"
else
    echo "   ✗ aoc-verify does not use getopts"
    exit 1
fi

# Test validation logic presence
validation_tests=(
    "aoc-test:2015.*CURRENT_YEAR"
    "aoc-test:AOC_YEAR.*CURRENT_YEAR"
    "aoc-test:AOC_DAY.*25"
    "aoc-verify:2015.*CURRENT_YEAR"
    "aoc-verify:AOC_YEAR.*CURRENT_YEAR"
    "aoc-verify:AOC_DAY.*25"
)

for test_case in "${validation_tests[@]}"; do
    script=$(echo "$test_case" | cut -d':' -f1)
    pattern=$(echo "$test_case" | cut -d':' -f2)

    if grep -q "$pattern" "./bin/$script"; then
        echo "   ✓ $script contains expected validation pattern: $pattern"
    else
        echo "   ✗ $script missing validation pattern: $pattern"
        exit 1
    fi
done

# Test solution verification logic in aoc-verify
if grep -q "jq.*solutions.json" "./bin/aoc-verify"; then
    echo "   ✓ aoc-verify contains solution verification logic"
else
    echo "   ✗ aoc-verify missing solution verification logic"
    exit 1
fi

echo
echo "=============================================="
echo "           ALL TESTS PASSED!"
echo "=============================================="
echo "The shell scripts in bin/ have been successfully tested."
echo "They contain expected functions, validation logic, and proper structure."
echo "Integration tests with actual containers would be needed for full testing."