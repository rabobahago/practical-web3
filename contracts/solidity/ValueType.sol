// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ValueType {
    // Boolean
    bool public _bool = true;

    // Boolean operators
    bool public _bool1 = !_bool; // logical NOT
    bool public _bool2 = _bool && _bool1; // logical AND
    bool public _bool3 = _bool || _bool1; // logical OR
    bool public _bool4 = _bool == _bool1; // equality
    bool public _bool5 = _bool != _bool1; // inequality

    // Integer
    int public _int = -1; // integers including negative numbers
    uint public _uint = 1; // non-negative numbers
    uint256 public _number = 20220330; // 256-bit positive integers

    // Integer operations
    uint256 public _number1 = _number + 1; // +, -, *, /
    uint256 public _number2 = 2 ** 2; // Exponent
    uint256 public _number3 = 7 % 2; // Modulo (Modulus)
    bool public _numberbool = _number2 > _number3; // Great than

    // Address
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _address1 = payable(_address); // payable address (can transfer fund and check balance)
    // Members of address
    uint256 public balance = _address1.balance; // balance of address

    // Fixed-size byte arrays
    bytes32 public _byte32 = "MiniSolidity";
    bytes1 public _byte = _byte32[0];

    // Let uint 0,  1,  2 represent Buy, Hold, Sell
    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    // Create an enum variable called action
    ActionSet action = ActionSet.Buy;

    // Enum can be converted into uint
    function enumToUint() external view returns (uint) {
        return uint(action);
    }
}
