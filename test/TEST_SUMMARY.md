# Unit Tests for Advent of Code Shell Scripts

## Overview

This directory contains comprehensive unit tests for the shell scripts in the `bin/` directory of the Advent of Code project. The tests verify both static structure and functional logic without requiring actual container execution.

## Test Files Created

### 1. `simple-test.sh`
- **Purpose**: Basic existence, syntax, and structural validation
- **Tests**:
  - Script existence and executability
  - Syntax validation using `bash -n`
  - Presence of key functions in scripts
  - Expected patterns in script content

### 2. `functional-test.sh`
- **Purpose**: Functional testing of core utility functions
- **Tests**:
  - `container_name` function correctness
  - Basic `run_cmd` function structure
  - Script sourcing of `utils.sh`
  - Usage of essential patterns like `getopts`

### 3. `logic-test.sh`
- **Purpose**: Validation of argument parsing and business logic
- **Tests**:
  - Year validation (2015 to current year)
  - Day range validation (1-25)
  - Current day validation
  - Solution verification logic using `jq`
  - Language directory validation

### 4. `complete-test.sh`
- **Purpose**: Complete end-to-end test suite
- **Tests all the above with proper error handling**

## Key Features Tested

### Script Structure
- All scripts are executable and exist
- Proper use of `getopts` for argument parsing
- Correct sourcing of `utils.sh`
- Use of environment variables (`AOC_ROOT`, etc.)

### Validation Logic
- Year range validation (2015 to current year)
- Day range validation (1-25)
- Current day validation to prevent future dates
- Solution verification using JSON processing with `jq`

### Utility Functions
- `run_cmd` - Executes commands with dry-run support
- `container_name` - Generates container names consistently
- `container_exec` - Executes commands in containers
- `container_run` - Runs containers with proper mounting
- `container_state` - Checks container states

## Test Coverage

The tests cover:

1. **Static Analysis**: Script existence, syntax, permissions
2. **Structure Validation**: Proper use of bash patterns and conventions
3. **Logic Validation**: Argument validation and business rules
4. **Functionality Testing**: Core utility functions work as expected

## Limitations

These are **unit tests only** and do not test:

- Actual container execution (requires Docker)
- Real network operations (for downloading data)
- Integration with actual Advent of Code solutions
- Error handling in complex scenarios

For full testing, integration tests with actual containers would be required.

## Running Tests

```bash
# Run individual tests
./simple-test.sh
./functional-test.sh  
./logic-test.sh
./complete-test.sh

# Or run all at once
for test in ./test/*.sh; do $test; done
```

## Future Improvements

- Add integration tests with mock containers
- Include network operation testing
- Add error condition testing
- Implement CI pipeline for automated testing