// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Faucet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function withdraw(uint _amount) public payable {
        require(_amount <= 1 ether);
        (bool successs, ) = payable(msg.sender).call{value: _amount}("");
        require(successs);
    }

    function withdrawAll() public payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }

    function destroyFaucets() public onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
