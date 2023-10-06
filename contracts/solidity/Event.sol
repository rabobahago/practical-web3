// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Event {
    mapping(address => uint) public balances;
    event Transfer(address indexed _from, address _to, uint _value);

    // define _transfer function，execute transfer logic
    function _transfer(address from, address to, uint256 amount) external {
        balances[from] = 10000000; // give some initial tokens to transfer address

        balances[from] -= amount; // "from" address minus the number of transfer
        balances[to] += amount; // "to" address adds the number of transfer

        // emit event
        emit Transfer(from, to, amount);
    }
    //how to calculate transaction hash of event
    //keccak256("Transfer(addrses,address,uint256)")

    //0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
}
