// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OtherContract {
    uint256 private _x = 0; // state variable _x
    // Receive the eth event and record the amount and gas
    event Log(uint amount, uint gas);

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

    // read_x
    function getX() external view returns (uint x) {
        x = _x;
    }
}

contract SecondContract {
    function setXTransferETH(
        address otherContract,
        uint256 x
    ) external payable {
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}
