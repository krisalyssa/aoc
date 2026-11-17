#!/bin/bash

# Test run_cmd function with all permutations of AOC_DRY_RUN and AOC_VERBOSE flags
# This test specifically verifies the correct behavior for each flag combination

source "${BASH_SOURCE%/*}/../bin/utils.sh"

# Function to test a specific permutation of flags
test_permutation() {
    local dry_run="$1"
    local verbose="$2"
    local description="$3"

    echo "Testing: $description"

    # Set the environment variables
    AOC_DRY_RUN="$dry_run"
    AOC_VERBOSE="$verbose"

    # Capture output from run_cmd
    local output
    if [[ -n "$dry_run" ]]; then
        # In dry-run mode, we expect no output regardless of verbose setting
        output=$(run_cmd "echo 'test command'" 2>&1)
        assertEquals "Dry run mode should produce no output" "" "$output"
    else
        # In non-dry-run mode, check verbose behavior
        if [[ -n "$verbose" ]]; then
            # Verbose mode should produce output
            output=$(run_cmd "echo 'test command'" 2>&1)
            assertTrue "Verbose mode should produce output" "[[ -n \"${output}\" ]]"
        else
            # Non-verbose mode should produce no output
            output=$(run_cmd "echo 'test command'" 2>&1)
            assertEquals "Non-verbose mode should produce no output" "" "$output"
        fi
    fi

    echo "✓ $description passed"
}

# Main test function
main() {
    echo "=== Testing run_cmd with all flag permutations ==="

    # Test all four combinations of AOC_DRY_RUN and AOC_VERBOSE
    test_permutation "" "" "Normal operation (no flags)"
    test_permutation "" "1" "Verbose mode only"
    test_permutation "1" "" "Dry run mode only"
    test_permutation "1" "1" "Both dry run and verbose modes"

    echo ""
    echo "All run_cmd permutation tests passed! ✓"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi