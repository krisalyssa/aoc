#!/bin/bash
# Test validate_year function
test_validate_year() {
    # Test valid years
    validate_year 2015 > /dev/null 2>&1
    assertTrue "validate_year 2015 should pass" $?

    validate_year "$(get_current_year)" > /dev/null 2>&1
    assertTrue "validate_year current year should pass" $?

    # Test invalid years
    validate_year 2014 > /dev/null 2>&1
    assertFalse "validate_year 2014 should fail" $?

    validate_year 2027 > /dev/null 2>&1
    assertFalse "validate_year 2027 should fail" $?

    validate_year "" > /dev/null 2>&1
    assertFalse "validate_year empty string should fail" $?
}

# Test validate_day function
test_validate_day() {
    # Test valid days
    validate_day 1 2023 > /dev/null 2>&1
    assertTrue "validate_day 1 should pass" $?

    validate_day 25 2023 > /dev/null 2>&1
    assertTrue "validate_day 25 should pass" $?

    # Test invalid days
    validate_day 0 2023 > /dev/null 2>&1
    assertFalse "validate_day 0 should fail" $?

    validate_day 26 2023 > /dev/null 2>&1
    assertFalse "validate_day 26 should fail" $?

    validate_day "" 2023 > /dev/null 2>&1
    assertFalse "validate_day empty string should fail" $?
}
