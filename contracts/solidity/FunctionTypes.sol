// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FunctionTypes {
    uint256 public number = 5;

    // pure
    function addPure(
        uint256 _number
    ) external pure returns (uint256 new_number) {
        new_number = _number + 1;
    }

    // internal
    function minus() internal {
        number = number - 1;
    }

    // external
    function minusCall() external {
        minus();
    }

    // view
    function addView() external view returns (uint256 new_number) {
        new_number = number + 1;
    }

    // payable: money (ETH) can be sent to the contract via this function
    function minusPayable() external payable returns (uint256 balance) {
        minus();
        balance = address(this).balance;
    }
}
