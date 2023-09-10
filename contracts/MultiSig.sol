// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MultiSig {
    address[] public owners;
    uint public required;
    uint public transactionCount;

    struct Transaction {
        address destinations;
        uint value;
        bool executed;
    }
    mapping(uint256 => Transaction) public transactions;
    mapping(uint => mapping(address => bool)) public confirmations;

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Required  more than zero address");
        require(_required > 0);
        require(_required <= _owners.length);
        owners = _owners;
        required = _required;
    }

    function confirmTransaction(uint transactionId) public {
        confirmations[transactionId][msg.sender] = true;
    }

    function getConfirmationsCount(
        uint transactionId
    ) public view returns (uint) {
        uint count;
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[transactionId][owners[i]]) {
                count += 1;
            }
        }
        return count;
    }

    function addTransaction(
        address _destination,
        uint _value
    ) public returns (uint) {
        uint transactionId = transactionCount;
        transactions[transactionId] = Transaction(_destination, _value, false);
        transactionCount += 1;
        return transactionId;
    }
}