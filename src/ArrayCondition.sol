// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

/**
 * @title ArrayCondition
 * @notice A minimal contract to demonstrate branch coverage bug with array length conditions
 */
contract ArrayCondition {
    uint8 public constant MAX_SIZE = 32;
    error TooLarge();
    error EmptyArray();

    // Storage variable to ensure the constructor does something
    uint256 private _arrayLength;

    constructor(uint256[] memory values) {
        // Check for empty array
        if (values.length == 0) {
            revert EmptyArray();
        }

        // This is the branch that's not being recognized by the coverage tool
        if (values.length > MAX_SIZE) {
            revert TooLarge();
        }

        // Store the array length
        _arrayLength = values.length;
    }

    function getArrayLength() external view returns (uint256) {
        return _arrayLength;
    }
}