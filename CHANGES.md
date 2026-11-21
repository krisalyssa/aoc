# AoC Project - Shared Utilities Implementation

## Summary

I've successfully implemented shared utility functions for date validation in the AoC project to improve code maintainability and reduce redundancy. The changes include:

## Files Modified

1. **bin/utils.sh** - Created new shared utilities file with:
   - `get_current_year()` - Gets current year using the system date
   - `get_current_day()` - Gets current day using the system date
   - `validate_year()` - Validates year is between 2015 and current year
   - `validate_day()` - Validates day is between 1-25 and not in the future

2. **bin/aoc-get** - Updated to use shared utilities:
   - Added `source "${AOC_ROOT}/bin/utils.sh"`
   - Replaced hardcoded date functions with `get_current_year()` and `get_current_day()`
   - Replaced year validation with `validate_year()`

3. **bin/aoc-init** - Updated to use shared utilities:
   - Added `source "${AOC_ROOT}/bin/utils.sh"`
   - Replaced hardcoded date functions with `get_current_year()`
   - Replaced year validation with `validate_year()`

4. **bin/aoc-start** - Updated to use shared utilities:
   - Added `source "${AOC_ROOT}/bin/utils.sh"`
   - Replaced hardcoded date functions with `get_current_year()`
   - Replaced year validation with `validate_year()`

5. **bin/aoc-stop** - Updated to use shared utilities:
   - Added `source "${AOC_ROOT}/bin/utils.sh"`
   - Replaced hardcoded date functions with `get_current_year()`
   - Replaced year validation with `validate_year()`

## Benefits

- **Code Reusability**: Common date validation logic is now centralized
- **Maintainability**: Changes to date handling only need to be made in one place
- **Consistency**: All scripts now use the same validation logic
- **Future-proofing**: Easier to update date-related functionality across all scripts

## Test Coverage

I've added comprehensive tests for the new validation functions:

- Created `test/test-utils-validation.sh` with tests for all new utility functions
- Updated `test/run-tests.sh` to include the new validation tests
- Verified that all validation functions work correctly with both valid and invalid inputs

The implementation ensures that all AoC scripts consistently validate years (2015-current year) and days (1-25, with future day checking for current year), making the codebase more robust and maintainable.

## Implementation Details

The shared utilities handle:

- Getting current year and day from system date
- Validating years are between 2015 and current year (inclusive)
- Validating days are between 1-25 and not in the future for current year
