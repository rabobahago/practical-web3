// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Collectible {
    event Deployed(address _owner);
    event Transfer(address owner, address newOwner);
    event ForSale(uint, uint);
    event Purchase(uint amount, address buyer);
    address public owner;
    uint price;

    constructor() {
        //set the deployer as the owner of this contract
        owner = msg.sender;
        //emit Deployer event
        emit Deployed(owner);
    }

    function transfer(address _recipient) external {
        //check if the person calling function is the same as owner
        require(msg.sender == owner);
        //transfer ownership from the owner to address provided
        owner = _recipient;
        //emit transfer event
        emit Transfer(msg.sender, _recipient);
    }

    function markPrice(uint _price) external {
        //check if the person calling function is the same as owner
        require(msg.sender == owner);
        //set price equal to _price
        price = _price;
        //emit ForSale event
        emit ForSale(_price, block.timestamp);
    }

    function purchase() external payable {
        //value set by the person calling this function most be equal to price else revert
        require(msg.value == price, "not enough  ether");
        //Mark the item for sale
        require(price > 0, "2");
        //mark the item not for sale anymore since it has been sold
        price = 0;
        //transfer ether to the seller
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
        //set the new owner as the person currently interacting with this function
        owner = msg.sender;
        //emit Purchase event
        emit Purchase(msg.value, msg.sender);
    }
}
