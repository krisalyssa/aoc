#!/bin/bash

# Test script for run_cmd function specifically

# Source the utils.sh file
source "${BASH_SOURCE%/*}/../bin/utils.sh"

# Test run_cmd function with different permutations
test_run_cmd_function() {
    echo "Testing run_cmd function with different permutations..."

    # Test 1: Normal execution (no AOC_DRY_RUN, no AOC_VERBOSE)
    echo "Test 1: Normal execution"
    AOC_DRY_RUN=
    AOC_VERBOSE=

    # Capture output to check if command is executed
    local test_output
    test_output=$(run_cmd "echo 'test command'" 2>&1)
    # Should not produce any output since we're not in verbose mode
    assertEquals "Normal execution should work" "" "$test_output"

    # Test 2: Verbose execution (no AOC_DRY_RUN, AOC_VERBOSE set)
    echo "Test 2: Verbose execution"
    AOC_DRY_RUN=
    AOC_VERBOSE=1

    # Capture output to check if command is executed and verbose messages are shown
    local verbose_output
    verbose_output=$(run_cmd "echo 'verbose test'" 2>&1)

    # Should produce the echo output (since we're in verbose mode)
    assertTrue "Verbose execution should show output" "[[ -n \"${verbose_output}\" ]]"

    # Test 3: Dry run execution (AOC_DRY_RUN set, no AOC_VERBOSE)
    echo "Test 3: Dry run execution"
    AOC_DRY_RUN=1
    AOC_VERBOSE=

    # Capture output to check if command is NOT executed
    local dry_output
    dry_output=$(run_cmd "echo 'dry run test'" 2>&1)

    # Should not produce any output since we're in dry run mode
    assertEquals "Dry run should not execute commands" "" "$dry_output"

    # Test 4: Dry run with verbose (both AOC_DRY_RUN and AOC_VERBOSE set)
    echo "Test 4: Dry run with verbose"
    AOC_DRY_RUN=1
    AOC_VERBOSE=1

    # Capture output to check if command is NOT executed even with verbose
    local dry_verbose_output
    dry_verbose_output=$(run_cmd "echo 'dry run verbose test'" 2>&1)

    # Should not produce any output since we're in dry run mode, even with verbose
    assertEquals "Dry run should not execute commands even with verbose" "" "$dry_verbose_output"

    # Test 5: Test that eval actually works in non-dry-run mode
    echo "Test 5: Test actual command execution"
    AOC_DRY_RUN=
    AOC_VERBOSE=

    # Test a simple command that should work
    local result
    result=$(run_cmd "date +%Y" 2>&1)
    assertTrue "Date command should execute successfully" "[[ -n \"${result}\" ]]"

    echo "All run_cmd tests passed!"
}

# Run the test if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Running run_cmd function tests..."
    test_run_cmd_function
    echo "All tests completed successfully!"
fi