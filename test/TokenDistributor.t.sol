// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TokenDistributor.sol";
import { WETH } from "solmate/tokens/WETH.sol";

contract TDTest is Test {
    address payable constant public WETHAddr = payable(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1); // ARB_WETH
    TokenDistributor public td;

    event Received(uint msg);
    receive() external payable {
        emit Received(msg.value);
    }

    function setUp() public {
        td = new TokenDistributor(ERC20(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1), address(this),0,999999999999999);

        WETH(WETHAddr).deposit{value: 1e18}();
        WETH(WETHAddr).transfer(address(td), 1e18);
    }

    function testChange() public {
        td.changePeriod(0,1);
    }

    function testSetClaim() public {
        address [] memory to = new address[](1);
        to[0] =   address(this);
        uint256[] memory pay = new uint256[](1);
        pay[0] = 1337;
        td.setRecipients(to, pay);
    }

    function testClaim() public {
        testSetClaim();
        td.claim();
        assertEq(WETH(WETHAddr).balanceOf(address(this)), 1337);
    }

    function testFail_NoClaim() public {
        testSetClaim();
        testChange();
        td.claim();
        assertEq(WETH(WETHAddr).balanceOf(address(this)), 1337);
    }
}