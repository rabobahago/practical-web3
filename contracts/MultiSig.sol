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

    receive() external payable {}

    function isConfirmed(uint transactionId) public view returns (bool) {
        return getConfirmationsCount(transactionId) >= required;
    }

    function isOwner(address _add) public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == _add) {
                return true;
            }
        }
        return false;
    }

    function confirmTransaction(uint transactionId) public {
        require(isOwner(msg.sender), "You  are  not owner");
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
    ) internal returns (uint) {
        uint transactionId = transactionCount;
        transactions[transactionId] = Transaction(_destination, _value, false);
        transactionCount += 1;
        return transactionId;
    }

    function submitTransaction(address _destination, uint _value) external {
        uint id = addTransaction(_destination, _value);
        confirmTransaction(id);
    }
}
