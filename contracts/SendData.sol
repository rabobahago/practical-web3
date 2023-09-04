// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

//type A calling contract addresses
contract A {
    function setValueOnB(address b) external {
        (bool success, ) = b.call(
            abi.encodeWithSignature("setValue(uint256)", 20)
        );
        require(success);
    }
}

contract B {
    uint public x;

    function setValue(uint256 _x) external {
        x = _x;
        console.log(x); //20
    }
}

//type B calling contract addresses
contract C {
    function setValueOnD(address c) external {
        D(c).setValue(30);
    }
}

contract D {
    uint256 public x;

    function setValue(uint _x) external {
        x = _x;
        console.log(x); //30
    }
}

//type C: interface method
interface F {
    function setValue(uint256) external;
}

contract E {
    function setValueOnF(address e) external {
        F(e).setValue(50);
    }
}
