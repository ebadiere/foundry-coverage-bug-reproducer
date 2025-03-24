// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "forge-std/Test.sol";
import "../src/ArrayCondition.sol";

/**
 * @title ArrayConditionTest
 * @notice Tests for the ArrayCondition contract
 */
contract ArrayConditionTest is Test {
    // Test with valid array size (should NOT revert)
    function testValidSize() public {
        uint256[] memory values = new uint256[](10);
        ArrayCondition condition = new ArrayCondition(values);
        assertEq(condition.getArrayLength(), 10);
    }
    
    // Test with maximum array size (should NOT revert)
    function testMaxSize() public {
        uint256[] memory values = new uint256[](32);
        ArrayCondition condition = new ArrayCondition(values);
        assertEq(condition.getArrayLength(), 32);
    }
    
    // Test with too large array size (should revert)
    function testTooLarge() public {
        uint256[] memory values = new uint256[](33);
        vm.expectRevert(ArrayCondition.TooLarge.selector);
        new ArrayCondition(values);
    }
    
    // Test with empty array (should revert)
    function testEmptyArray() public {
        uint256[] memory values = new uint256[](0);
        vm.expectRevert(ArrayCondition.EmptyArray.selector);
        new ArrayCondition(values);
    }
}