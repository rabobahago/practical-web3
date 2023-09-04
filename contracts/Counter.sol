// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Counter {
    int public counter;

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
}
