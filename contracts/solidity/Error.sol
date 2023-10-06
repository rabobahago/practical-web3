// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
error TransferError();

contract Error {
    mapping(uint => address) public owners;

    function transfer(uint _tokenId, address newOwner) external {
        if (owners[_tokenId] != msg.sender) {
            revert TransferError();
        } else {
            owners[_tokenId] = newOwner;
        }
    }
}
