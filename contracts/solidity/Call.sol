// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OtherContract {
    uint256 private _x = 0; // state variable x
    // Receive the eth event and record the amount and gas
    event Log(uint amount, uint gas);

    fallback() external payable {}

    // Return the contract ETH balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // You can adjust the function of state variable _x and transfer ETH (payable) to the contract
    function setX(uint256 x) external payable {
        _x = x;
        // If ETH is transferred, release the Log event
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    // read x
    function getX() external view returns (uint x) {
        x = _x;
    }

    receive() external payable {}
}

contract Call {
    //Define the Response event and output the success and data returned by the call
    event Response(bool success, bytes data);

    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX(), you can send ETH at the same time
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );
        emit Response(success, data); //Release event
    }

    receive() external payable {}
}
