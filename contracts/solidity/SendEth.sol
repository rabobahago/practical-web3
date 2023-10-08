// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SendEth {
    error SendFailed();
    error CallFailed();

    //Constructor, payable allows you to transfer eth into it during deployment
    constructor() payable {}

    //receive method, triggered when receiving eth
    receive() external payable {}

    // Use transfer() to send ETH
    function transferETH(address payable _to, uint256 amount) external payable {
        _to.transfer(amount);
    }

    // send() sends ETH
    function sendETH(address payable _to, uint256 amount) external payable {
        // Process the return value of send. If it fails, revert the transaction and send error
        bool success = _to.send(amount);
        if (!success) {
            revert SendFailed();
        }
    }

    // call() sends ETH
    function callETH(address payable _to, uint256 amount) external payable {
        // Process the return value of the call. If it fails, revert the transaction and send error
        (bool success, ) = _to.call{value: amount}("");
        if (!success) {
            revert CallFailed();
        }
    }
}
