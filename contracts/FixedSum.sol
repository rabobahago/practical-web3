// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract FixedSum {
    uint[3] public fix = [1, 2, 3];

    function modify() external view returns (uint[3] memory _fix) {
        uint[3] memory memoryArray = fix;
        memoryArray[0] = 1;
        return memoryArray;
    }

    function modifierStorage() external returns (uint[3] memory _fix) {
        uint[3] storage storageArray = fix;
        storageArray[2] = 50;
        return storageArray;
    }
}
