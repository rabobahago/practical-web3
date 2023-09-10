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
        bytes data;
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
        uint _value,
        bytes memory _data
    ) internal returns (uint) {
        uint transactionId = transactionCount;
        transactions[transactionId] = Transaction(
            _destination,
            _value,
            false,
            _data
        );
        transactionCount += 1;
        return transactionId;
    }

    function submitTransaction(
        address _destination,
        uint _value,
        bytes memory _data
    ) external {
        uint id = addTransaction(_destination, _value, _data);
        confirmTransaction(id);
    }

    function executeTransaction(uint transactionId) public {
        require(isConfirmed(transactionId));
        Transaction storage _tx = transactions[transactionId];
        (bool success, ) = _tx.destinations.call{value: _tx.value}(_tx.data);
        require(success);
        _tx.executed = true;
    }

    function confirmTransaction(uint transactionId) public {
        require(isOwner(msg.sender), "You  are  not owner");
        confirmations[transactionId][msg.sender] = true;
        if (isConfirmed(transactionId)) {
            executeTransaction(transactionId);
        }
    }
}
