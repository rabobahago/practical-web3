// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MappingData {
    uint public numSodas = 5;
    mapping(address => bool) public members;
    mapping(address => uint) public sodasPurchased;
    struct Collectable {
        address owner;
        uint price;
        bool forSale;
    }
    struct User {
        uint balance;
        bool isActive;
    }
    mapping(uint => Collectable) public idCollectable;
    mapping(address => User) public users;
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

    function purchase(uint _id) external payable {
        Collectable storage collectableCol = idCollectable[_id];
        require(msg.value >= collectableCol.price);
        collectableCol.owner = msg.sender;
        collectableCol.forSale = false;
    }

    function createUser() external {
        User storage user = users[msg.sender];
        require(!user.isActive, "address already a user");
        user.balance = 100;
        user.isActive = true;
    }

    function transfer(address _to, uint _amount) external {
        require(users[msg.sender].isActive, "not active  user");
        require(users[_to].isActive, "Not active user");
        users[msg.sender].balance -= _amount;
        users[_to].balance += _amount;
    }
}
