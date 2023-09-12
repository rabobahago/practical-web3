// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Token {
    string public name = "Falafel";
    string public symbol = "FLF";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balance;

    function balanceOf(address _add) public returns (uint) {
        return balance[_add];
    }
}
