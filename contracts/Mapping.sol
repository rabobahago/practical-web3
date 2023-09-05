// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MappingData {
    uint public numSodas = 5;
    mapping(address => bool) public members;
    mapping(address => uint) public sodasPurchased;
    modifier onlySodas() {
        require(numSodas > 1);
        _;
    }

    function purchasedSodas(address _add) public onlySodas returns (uint) {
        sodasPurchased[_add] += 1;
        numSodas--;
        return sodasPurchased[_add];
    }

    function addMember(address _add) external {
        require(!members[_add], "you are already member");
        members[_add] = true;
    }

    function isMember(address _add) external view returns (bool) {
        return members[_add];
    }

    function removeMember(address _add) external {
        require(!members[_add], "Not a member");
        members[_add] = false;
    }
}
