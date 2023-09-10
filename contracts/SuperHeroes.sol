// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Hero {
    uint public health = 100;

    constructor(uint _health) {
        health = _health;
    }

    function takeDamage(uint damage) external {
        health -= damage;
    }
}

contract Mage is Hero(100) {}

contract Warrior is Hero(50) {}
