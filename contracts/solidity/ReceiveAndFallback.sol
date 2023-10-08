// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ReceiveAndFallback {
    // Define events
    event Received(address Sender, uint Value);
    FallbackCalled(address indexed,address indexed, uint);
    // Release the Received event when receiving ETH
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // fallback
    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}
