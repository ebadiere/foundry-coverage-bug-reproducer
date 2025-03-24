// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "forge-std/Test.sol";
import "../src/SimpleCondition.sol";

/**
 * @title SimpleConditionTest
 * @notice Tests for the SimpleCondition contract
 */
contract SimpleConditionTest is Test {
    // Test with valid size (should NOT revert)
    function testValidSize() public {
        new SimpleCondition(10); // Less than MAX_SIZE
    }
    
    // Test with maximum size (should NOT revert)
    function testMaxSize() public {
        new SimpleCondition(32); // Exactly MAX_SIZE
    }
    
    // Test with too large size (should revert)
    function testTooLarge() public {
        vm.expectRevert(SimpleCondition.TooLarge.selector);
        new SimpleCondition(33); // Greater than MAX_SIZE
    }
}