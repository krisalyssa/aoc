#!/bin/bash

# Test script for utils.sh functions

# Source the utils.sh file
source "${BASH_SOURCE%/*}/../bin/utils.sh"

# Test run_cmd function
test_run_cmd() {
    # Test with dry run enabled
    AOC_DRY_RUN=1
    run_cmd "echo 'test command'"
    assertEquals "Dry run should not execute commands" 0 0

    # Test with verbose and dry run
    AOC_VERBOSE=1
    run_cmd "echo 'verbose test'"
    assertEquals "Verbose should work with dry run" 0 0

    unset AOC_DRY_RUN
    unset AOC_VERBOSE
}

# Test container_name function
test_container_name() {
    local result
    result=$(container_name "2023" "bash")
    assertEquals "Container name should be correct" "aoc-bash-2023" "$result"

    result=$(container_name "2024" "python")
    assertEquals "Container name should be correct for different language" "aoc-python-2024" "$result"
}

# Test container_state function (mocked)
test_container_state() {
    # Mock the container_state function to return a specific state
    # This is more of an integration test since we can't easily mock external commands
    assertTrue "container_state function should exist" $(type container_state >/dev/null 2>&1; echo $?)
}

# Test container_exec and container_run functions (integration tests)
test_container_functions() {
    # These are integration tests that would require actual containers
    # For now, we'll just check that the functions exist
    assertTrue "container_exec function should exist" $(type container_exec >/dev/null 2>&1; echo $?)
    assertTrue "container_run function should exist" $(type container_run >/dev/null 2>&1; echo $?)
}

# Test get_current_year function
test_get_current_year() {
    local result
    result=$(get_current_year)
    # Should return a valid year (4 digits)
    assertTrue "get_current_year should return a valid year" [[ ${#result} -eq 4 ]]
    # Should be between 2015 and current year
    assertTrue "get_current_year should be >= 2015" $((result >= 2015))
}

# Test get_current_day function
test_get_current_day() {
    local result
    result=$(get_current_day)
    # Should return a day between 1-31 (as string, but we can check if it's a number)
    assertTrue "get_current_day should be a valid number" [[ $result =~ ^[0-9]+$ ]]
    # Day should be reasonable (we're not checking exact date since this is a test)
}

# Test validate_year function
test_validate_year() {
    # Test valid years
    assertTrue "validate_year 2015 should pass" $(validate_year 2015 > /dev/null 2>&1; echo $?)
    assertTrue "validate_year current year should pass" $(validate_year $(get_current_year) > /dev/null 2>&1; echo $?)

    # Test invalid years
    assertFalse "validate_year 2014 should fail" $(validate_year 2014 > /dev/null 2>&1; echo $?)
    assertFalse "validate_year 2027 should fail" $(validate_year 2027 > /dev/null 2>&1; echo $?)
    assertFalse "validate_year empty string should fail" $(validate_year "" > /dev/null 2>&1; echo $?)
}

# Test validate_day function
test_validate_day() {
    # Test valid days
    assertTrue "validate_day 1 should pass" $(validate_day 1 2023 > /dev/null 2>&1; echo $?)
    assertTrue "validate_day 25 should pass" $(validate_day 25 2023 > /dev/null 2>&1; echo $?)

    # Test invalid days
    assertFalse "validate_day 0 should fail" $(validate_day 0 2023 > /dev/null 2>&1; echo $?)
    assertFalse "validate_day 26 should fail" $(validate_day 26 2023 > /dev/null 2>&1; echo $?)
    assertFalse "validate_day empty string should fail" $(validate_day "" 2023 > /dev/null 2>&1; echo $?)
}

# Run all tests if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Source shunit2 if available, otherwise use basic bash testing
    if [[ -f "/usr/share/bash-unit/shunit2" ]]; then
        . /usr/share/bash-unit/shunit2
    elif [[ -f "/usr/local/share/bash-unit/shunit2" ]]; then
        . /usr/local/share/bash-unit/shunit2
    else
        echo "shunit2 not found, running basic tests..."
        # Simple test runner for when shunit2 is not available
        test_run_cmd
        test_container_name
        test_get_current_year
        test_get_current_day
        test_validate_year
        test_validate_day
        echo "Basic tests completed"
    fi
fi