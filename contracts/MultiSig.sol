// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MultiSig {
    address[] public owners;
    uint public required;

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Required  more than zero address");
        require(_required > 0);
        require(_required <= _owners.length);
        owners = _owners;
        required = _required;
    }
}
