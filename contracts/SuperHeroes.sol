// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Hero {
    uint public health = 100;

    function takeDamage(uint damage) external {
        health -= damage;
    }
}

contract Mage is Hero {}

contract Warrior is Hero {}
