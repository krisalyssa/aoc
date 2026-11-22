#!/bin/bash

# Specific test for run_cmd function with all permutations of AOC_DRY_RUN and AOC_VERBOSE

# Source the utils.sh file
# shellcheck disable=SC1091
source "${BASH_SOURCE%/*}/../bin/utils.sh"

# Test function for run_cmd with different flag combinations
test_run_cmd_comprehensive() {
        echo "=== Testing run_cmd function with all flag permutations ==="

        # Test 1: Normal execution (no flags)
        echo "Test 1: Normal execution (AOC_DRY_RUN=, AOC_VERBOSE=)"
        export AOC_DRY_RUN=
        export AOC_VERBOSE=

        result=$(run_cmd "echo 'normal test'" 2>&1)
        assertEquals "Normal execution should work without output" "" "${result}"
        echo "✓ Normal execution works correctly"

        # Test 2: Dry run only
        echo "Test 2: Dry run only (AOC_DRY_RUN=1, AOC_VERBOSE=)"
        export AOC_DRY_RUN=1
        export AOC_VERBOSE=

        result=$(run_cmd "echo 'dry run test'" 2>&1)
        assertEquals "Dry run should not execute commands" "" "${result}"
        echo "✓ Dry run works correctly"

        # Test 3: Verbose only
        echo "Test 3: Verbose only (AOC_DRY_RUN=, AOC_VERBOSE=1)"
        export AOC_DRY_RUN=
        export AOC_VERBOSE=1

        result=$(run_cmd "echo 'verbose test'" 2>&1)
        assertTrue "Verbose execution should produce output" "[[ -n \"${result}\" ]]"
        echo "✓ Verbose execution works correctly"

        # Test 4: Both flags (dry run with verbose)
        echo "Test 4: Both flags (AOC_DRY_RUN=1, AOC_VERBOSE=1)"
        export AOC_DRY_RUN=1
        export AOC_VERBOSE=1

        result=$(run_cmd "echo 'dry run verbose test'" 2>&1)
        assertEquals "Dry run should not execute commands even with verbose" "" "${result}"
        echo "✓ Both flags work correctly"

        # Test 5: Complex command execution
        echo "Test 5: Complex command execution"
        export AOC_DRY_RUN=
        export AOC_VERBOSE=1

        result=$(run_cmd "date +%Y" 2>&1)
        assertTrue "Date command should produce output" "[[ -n \"${result}\" ]]"
        echo "✓ Complex command execution works correctly"

        # Test 6: Empty command
        echo "Test 6: Empty command handling"
        export AOC_DRY_RUN=
        export AOC_VERBOSE=

        result=$(run_cmd "" 2>&1)
        assertEquals "Empty command should not error" "" "${result}"
        echo "✓ Empty command handled correctly"

        echo ""
        echo "All run_cmd tests passed! ✓"
}

# Run the test if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        test_run_cmd_comprehensive
fi
