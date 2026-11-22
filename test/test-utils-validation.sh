#!/bin/bash

# Test script for validation functions in utils.sh

# Source the utils.sh file
# shellcheck disable=SC1091
source "${BASH_SOURCE%/*}/../bin/utils.sh"

echo "Testing validation functions in utils.sh..."

# Test get_current_year function
echo "Testing get_current_year..."
current_year=$(get_current_year)
if [[ -n "${current_year}" && "${current_year}" =~ ^[0-9]+$ ]]; then
        echo "PASS: get_current_year returned a valid year: ${current_year}"
else
        echo "FAIL: get_current_year did not return a valid year"
        exit 1
fi

# Test get_current_day function
echo "Testing get_current_day..."
current_day=$(get_current_day)
if [[ -n "${current_day}" && "${current_day}" =~ ^[0-9]+$ ]]; then
        echo "PASS: get_current_day returned a valid day: ${current_day}"
else
        echo "FAIL: get_current_day did not return a valid day"
        exit 1
fi

# Test validate_year function with valid years
echo "Testing validate_year with valid years..."
if validate_year 2015; then
        echo "PASS: validate_year 2015"
else
        echo "FAIL: validate_year 2015"
        exit 1
fi

if validate_year 2020; then
        echo "PASS: validate_year 2020"
else
        echo "FAIL: validate_year 2020"
        exit 1
fi

current_year=$(get_current_year)
if validate_year "${current_year}"; then
        echo "PASS: validate_year current year"
else
        echo "FAIL: validate_year current year"
        exit 1
fi

# Test validate_year function with invalid years
echo "Testing validate_year with invalid years..."
if ! validate_year 2014; then
        echo "PASS: validate_year 2014 (correctly failed)"
else
        echo "FAIL: validate_year 2014 (should have failed)"
        exit 1
fi

# Note: 2025 is actually valid since current year is 2026
if ! validate_year 2027; then
        echo "PASS: validate_year 2027 (correctly failed - exceeds current year)"
else
        echo "FAIL: validate_year 2027 (should have failed)"
        exit 1
fi

if ! validate_year ""; then
        echo "PASS: validate_year empty string (correctly failed)"
else
        echo "FAIL: validate_year empty string (should have failed)"
        exit 1
fi

# Test validate_day function with valid days
echo "Testing validate_day with valid days..."
if validate_day 1 2020; then
        echo "PASS: validate_day 1"
else
        echo "FAIL: validate_day 1"
        exit 1
fi

if validate_day 10 2020; then
        echo "PASS: validate_day 10"
else
        echo "FAIL: validate_day 10"
        exit 1
fi

if validate_day 25 2020; then
        echo "PASS: validate_day 25"
else
        echo "FAIL: validate_day 25"
        exit 1
fi

# Test validate_day function with invalid days
echo "Testing validate_day with invalid days..."
if ! validate_day 0 2020; then
        echo "PASS: validate_day 0 (correctly failed)"
else
        echo "FAIL: validate_day 0 (should have failed)"
        exit 1
fi

if ! validate_day 26 2020; then
        echo "PASS: validate_day 26 (correctly failed)"
else
        echo "FAIL: validate_day 26 (should have failed)"
        exit 1
fi

if ! validate_day "" 2020; then
        echo "PASS: validate_day empty string (correctly failed)"
else
        echo "FAIL: validate_day empty string (should have failed)"
        exit 1
fi

echo "All validation tests completed successfully."
