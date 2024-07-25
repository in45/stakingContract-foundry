// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import "forge-std/Test.sol";
import "../src/Staking.sol";
import "../src/MockERC20.sol";


contract StakingTest is Test {
    Staking public staking;
    MockERC20 public token;
    address public owner;
    address public user;

    function setUp() public {
        owner = address(0x1);
        user = address(0x2);

        token = new MockERC20("TestToken", "TTK");
        staking = new Staking(IERC20(address(token)));

        // Mint tokens for testing
        token.mint(owner, 10000e18);
        token.mint(user, 10000e18);

        // Approve staking contract to spend tokens
        vm.startPrank(owner);
        token.approve(address(staking), 10000e18);
        vm.stopPrank();

        vm.startPrank(user);
        token.approve(address(staking), 10000e18);
        vm.stopPrank();
    }

    function testDeposit() public {
        vm.startPrank(user);
        staking.deposit(1000e18); // Deposit 1000 tokens
        vm.stopPrank();

        uint balance = staking.balanceOf(user);
        assertEq(balance, 1000e18);
    }

    function testClaim() public {
        vm.startPrank(user);
        staking.deposit(1000e18); // Deposit 1000 tokens
        vm.warp(block.timestamp + 1 hours); // Move time forward
        staking.claim(); // Claim rewards
        vm.stopPrank();

        uint claimedAmount = token.balanceOf(user);
        assertGt(claimedAmount, 0);
    }

    function testCompound() public {
        vm.startPrank(user);
        staking.deposit(1000e18); // Deposit 1000 tokens
        vm.warp(block.timestamp + 1 hours); // Move time forward
        staking.compound(); // Compound rewards
        vm.stopPrank();

        uint balance = staking.balanceOf(user);
        assertGt(balance, 1000e18);
    }

    function testWithdraw() public {
        vm.startPrank(user);
        staking.deposit(1000e18); // Deposit 1000 tokens
        vm.warp(block.timestamp + 1 hours); // Move time forward
        staking.compound(); // Compound rewards
        staking.withdraw(500e18); 
        vm.stopPrank();

        uint balance = staking.balanceOf(user);
        assertGe(balance, 500e18); 
    }

}
