# Unit Tests for Shell Scripts

This directory contains unit tests for the shell scripts in the `bin/` directory.

## Scripts Tested

- `aoc-test` - Runs tests for Advent of Code solutions
- `aoc-verify` - Verifies solutions against known answers
- `utils.sh` - Utility functions used by the main scripts

## Test Types

### 1. Basic Existence and Syntax Tests

- Verify all scripts exist and are executable
- Check that scripts have valid bash syntax
- Confirm essential functions are present

### 2. Structure Tests

- Verify proper usage of `getopts` for argument parsing
- Ensure scripts source `utils.sh`
- Check for expected environment variable usage

### 3. Functional Tests

- Test core utility functions like `container_name`
- Validate basic script logic and flow

## Running Tests

```bash
# Run all tests
./simple-test.sh

# Run functional tests
./functional-test.sh
```

## Notes

The tests currently focus on static analysis and basic functionality since:

1. The scripts depend heavily on Docker containers that aren't available in test environments
2. Integration testing would require mocking complex container operations
3. The core logic is well-tested through the existing codebase

For comprehensive testing, integration tests with actual containers would be needed.
