// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

/**
 * @title SimpleCondition
 * @notice A minimal contract to demonstrate correct branch coverage with simple conditions
 */
contract SimpleCondition {
    uint8 public constant MAX_SIZE = 32;
    error TooLarge();

    constructor(uint256 size) {
        // Simple condition - this branch coverage works correctly
        if (size > MAX_SIZE) {
            revert TooLarge();
        }
    }
}