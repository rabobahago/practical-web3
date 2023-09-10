// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Party {
    uint public deposit;
    address[] public add;
    mapping(address => bool) isAdded;

    constructor(uint _amount) {
        deposit = _amount;
    }

    function rsvp() external payable {
        require(deposit == msg.value, "Not enough amount");
        require(!isAdded[msg.sender]);
        add.push(msg.sender);
        isAdded[msg.sender] = true;
    }

    function payBill(address venue, uint amount) external {
        (bool s, ) = venue.call{value: amount}("");
        require(s);
        uint share = address(this).balance / add.length;
        for (uint i = 0; i < add.length; i++) {
            (bool s1, ) = add[i].call{value: share}("");
            require(s1);
        }
    }
}
