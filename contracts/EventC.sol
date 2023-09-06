// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint amount);
}

contract EventC {
    function _transfer(address from, address to, uint amount) internal virtual {
        // perform various checks, such as the `from` address has `amount` of tokens

        emit Transfer(from, to, amount);
    }
}
