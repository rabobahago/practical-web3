// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Token {
    string public name = "Falafel";
    string public symbol = "FLF";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balances;
    event Transfer(address, address, uint256);

    constructor() {
        //total token created
        totalSupply = 1000 * (10 ** uint256(decimals));
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address _add) public view returns (uint) {
        return balances[_add];
    }

    function transfer(address _recipient, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient fund");
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(msg.sender, _recipient, _amount);
    }
}
