// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Grandfather {
    event Log(string msg);

    // Apply inheritance to the following 3 functions: hip(), pop(), man()，then log "Grandfather".
    function hip() public virtual {
        emit Log("Grandfather");
    }

    function pop() public virtual {
        emit Log("Grandfather");
    }

    function grandfather() public virtual {
        emit Log("Grandfather");
    }
}

contract Father is Grandfather {
    // Apply inheritance to the following 2 functions: hip() and pop()，then change the log value to "Father".
    function hip() public virtual override {
        emit Log("Father");
    }

    function pop() public virtual override {
        emit Log("Father");
    }

    function father() public virtual {
        emit Log("Father");
    }
}

contract Son is Grandfather, Father {
    // Apply inheritance to the following 2 functions: hip() and pop()，then change the log value to "Son".
    function hip() public virtual override(Grandfather, Father) {
        emit Log("Son");
    }

    function pop() public virtual override(Grandfather, Father) {
        emit Log("Son");
    }
}
