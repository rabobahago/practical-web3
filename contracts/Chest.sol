// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./IERC20.sol";

contract Chest {
    function plunder(address[] calldata _arr) external {
        for (uint i = 0; i < _arr.length; i++) {
            IERC20 token = IERC20(_arr[i]);
            uint balance = token.balanceOf(address(this));
            token.transfer(msg.sender, balance);
        }
    }
}
