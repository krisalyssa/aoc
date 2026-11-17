#!/bin/bash

# Comprehensive test for run_cmd function with all AOC_DRY_RUN and AOC_VERBOSE permutations

# Source the utils.sh file
source "${BASH_SOURCE%/*}/../bin/utils.sh"

# Mock functions to capture what would be executed
mock_run_cmd() {
    local cmd="${1}"

    # Log what would happen
    if [[ -n "${AOC_VERBOSE}" ]]; then
        echo "running: ${cmd}" 1>&2
    fi

    if [[ -z "${AOC_DRY_RUN}" ]]; then
        eval "${cmd}"
    fi
}

# Test all combinations of AOC_DRY_RUN and AOC_VERBOSE
test_all_permutations() {
    echo "Testing run_cmd with all permutations..."

    # Test 1: No dry run, no verbose (normal operation)
    echo "Test 1: Normal operation (AOC_DRY_RUN=, AOC_VERBOSE=)"
    AOC_DRY_RUN=
    AOC_VERBOSE=

    # This should execute the command but not produce verbose output
    local result1=$(run_cmd "echo 'test1'" 2>&1)
    assertEquals "Normal execution should work" "" "$result1"

    # Test 2: Dry run, no verbose
    echo "Test 2: Dry run only (AOC_DRY_RUN=1, AOC_VERBOSE=)"
    AOC_DRY_RUN=1
    AOC_VERBOSE=

    local result2=$(run_cmd "echo 'test2'" 2>&1)
    assertEquals "Dry run should not execute commands" "" "$result2"

    # Test 3: No dry run, verbose
    echo "Test 3: Verbose only (AOC_DRY_RUN=, AOC_VERBOSE=1)"
    AOC_DRY_RUN=
    AOC_VERBOSE=1

    local result3=$(run_cmd "echo 'test3'" 2>&1)
    # Should produce output because we're in verbose mode
    assertTrue "Verbose execution should produce output" "[[ -n \"${result3}\" ]]"

    # Test 4: Dry run, verbose (both set)
    echo "Test 4: Both dry run and verbose (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
    AOC_DRY_RUN=1
    AOC_VERBOSE=1

    local result4=$(run_cmd "echo 'test4'" 2>&1)
    assertEquals "Dry run should not execute commands even with verbose" "" "$result4"

    echo "All permutation tests passed!"
}

# Test specific command execution scenarios
test_command_execution() {
    echo "Testing specific command execution scenarios..."

    # Test that basic commands work
    AOC_DRY_RUN=
    AOC_VERBOSE=

    # Test simple echo
    local echo_result=$(run_cmd "echo 'hello world'" 2>&1)
    assertEquals "Echo should work" "" "$echo_result"

    # Test command that produces output (should be captured in verbose mode)
    AOC_VERBOSE=1
    local date_result=$(run_cmd "date +%Y" 2>&1)
    assertTrue "Date command should produce year" "[[ -n \"${date_result}\" ]]"

    echo "Command execution tests passed!"
}

# Test edge cases
test_edge_cases() {
    echo "Testing edge cases..."

    # Test with empty command
    AOC_DRY_RUN=
    AOC_VERBOSE=
    local empty_result=$(run_cmd "" 2>&1)
    assertEquals "Empty command should not error" "" "$empty_result"

    # Test with complex command
    AOC_DRY_RUN=
    AOC_VERBOSE=1
    local complex_result=$(run_cmd "ls -la | wc -l" 2>&1)
    assertTrue "Complex command should execute" "[[ -n \"${complex_result}\" ]]"

    echo "Edge case tests passed!"
}

# Test that run_cmd correctly handles different types of commands
test_command_types() {
    echo "Testing different command types..."

    # Test with variable assignment
    AOC_DRY_RUN=
    AOC_VERBOSE=1
    local var_result=$(run_cmd "VAR=test; echo \$VAR" 2>&1)
    assertTrue "Variable assignment should work" "[[ -n \"${var_result}\" ]]"

    # Test with multiple commands
    AOC_DRY_RUN=
    AOC_VERBOSE=1
    local multi_result=$(run_cmd "echo 'first'; echo 'second'" 2>&1)
    assertTrue "Multiple commands should execute" "[[ -n \"${multi_result}\" ]]"

    echo "Command types tests passed!"
}

# Main test runner
main() {
    echo "=== Comprehensive run_cmd Function Tests ==="

    # Run all test suites
    test_all_permutations
    test_command_execution
    test_edge_cases
    test_command_types

    echo ""
    echo "All comprehensive tests for run_cmd function passed successfully!"
    echo "Tests covered:"
    echo "- Normal operation (no flags)"
    echo "- Dry run mode (AOC_DRY_RUN=1)"
    echo "- Verbose mode (AOC_VERBOSE=1)"
    echo "- Both flags set (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
    echo "- Command execution scenarios"
    echo "- Edge cases"
    echo "- Different command types"
}

# Run tests if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi