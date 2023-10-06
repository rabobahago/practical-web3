// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Mapping {
    mapping(uint => address) public idToAddress; // id maps to address
    mapping(address => address) public swapPair; // mapping of token pairs, from address to address

    function writeMap(uint _Key, address _Value) public {
        idToAddress[_Key] = _Value;
    }
}
