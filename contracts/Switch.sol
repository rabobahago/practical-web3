// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Switch {
    uint lastAction;
    address public owner;
    address public pay;

    constructor(address _add) payable {
        lastAction = block.timestamp;
        owner = msg.sender;
        pay = _add;
    }

    function withdraw() external payable {
        uint diff = block.timestamp - lastAction;
        require(diff >= 52 weeks, "Not yet time to withdraw");
        (bool s, ) = pay.call{value: address(this).balance}("");
        require(s);
    }

    function ping() external {
        require(owner == msg.sender);
        lastAction = block.timestamp;
    }
}
