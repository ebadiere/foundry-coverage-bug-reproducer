# Foundry Coverage Bug Reproducer

This repository contains a minimal reproducer for a branch coverage bug in Foundry's coverage tool.

## Bug Description

The Foundry coverage tool fails to recognize certain branches in Solidity code, particularly in constructors with conditional checks on array lengths. Even with tests that explicitly exercise both branches of a condition, the tool fails to recognize that both branches have been covered.

## Reproduction Steps

1. Clone this repository
2. Run the tests: `forge test`
3. Run the coverage: `forge coverage --report summary`

## Expected Behavior

Both `SimpleCondition.sol` and `ArrayCondition.sol` should show 100% branch coverage, as all branches are tested.

## Actual Behavior

- `SimpleCondition.sol` shows 100% branch coverage
- `ArrayCondition.sol` shows less than 100% branch coverage, despite having tests for all branches

## Minimal Test Cases

This repository contains two minimal test cases:

1. `SimpleCondition.sol`: A contract with a simple numeric condition in the constructor
   - The coverage tool correctly identifies both branches

2. `ArrayCondition.sol`: A contract with an array length condition in the constructor
   - The coverage tool fails to identify both branches

## Impact

This bug affects the accuracy of coverage reports, potentially leading to false negatives in coverage checks. Developers may be misled into thinking that certain branches are not tested when they actually are.

## Additional Notes

This issue was discovered while working on a larger project where a contract with similar array length checks in the constructor showed 90% branch coverage despite having tests for all branches.