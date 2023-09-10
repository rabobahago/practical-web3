// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface Enemy {
    function takeAttack(Hero.AttackTypes attackType) external;
}

abstract contract Hero {
    uint public health = 100;

    constructor(uint _health) {
        health = _health;
    }

    function takeDamage(uint damage) external {
        health -= damage;
    }

    enum AttackTypes {
        Brawl,
        Spell
    }

    function attack(address enemy) public virtual;
}

contract Mage is Hero(100) {
    function attack(address _add) public override {
        Enemy enemy = Enemy(_add);
        enemy.takeAttack(Hero.AttackTypes.Spell);
    }
}

contract Warrior is Hero(50) {
    function attack(address _add) public override {
        Enemy enemy = Enemy(_add);
        enemy.takeAttack(Hero.AttackTypes.Brawl);
    }
}
