// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Counter {
    address public addressOne;
    address public addressTwo;
    int public counter;

    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    function get() public view returns (int) {
        return counter;
    }

    function inc() public {
        counter += 1;
    }

    function dec() public {
        counter -= 1;
    }

    function zero() public {
        counter = 0;
    }

    receive() external payable {
        uint totalValue = msg.value;
        (bool successOne, ) = addressOne.call{value: totalValue / 2}("");
        require(successOne);
        (bool successTwo, ) = addressTwo.call{value: totalValue / 2}("");
        require(successTwo);
    }

    function donate() external payable {
        (bool success, ) = charity.call{value: address(this).balance}("");
        require(success);
    }

    function tip() external payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }
}
