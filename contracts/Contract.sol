// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

error someThing();

contract Contract {
    address owner;

    constructor() payable {
        owner = msg.sender;
        //the two below are equivalent
        // require(msg.value >= 1 ether, 'require one ether or more');
        if (!(msg.value >= 1 ether)) {
            revert someThing();
        }
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function withdraw() public onlyOwner {
        //payable(msg.sender).transfer(address(this).balance);
        //OR
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }
}
