// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Modifier {
    address owner; // define owner variable

    // constructor
    constructor() {
        owner = msg.sender; //  set owner to the deployer address
    }

    // The function with the same name as the contract name(Parents) is constructor
    function Parents() public {}

    // define modifier
    modifier onlyOwner() {
        require(msg.sender == owner); // check whether caller is address of owner
        _; // execute the function body
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner; // only owner address can run this function and change owner
    }
}
