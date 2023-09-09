// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "hardhat/console.sol";

contract FixedSum {
    uint[3] public fix = [1, 2, 3];
    uint[] public evenNumbers;
    address[] members;

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

    function sum(uint[5] memory _sum) external pure returns (uint) {
        uint add = 0;
        for (uint i = 0; i < _sum.length; i++) {
            add += _sum[i];
        }
        return add;
    }

    function addition(uint[] memory ar) external pure returns (uint) {
        uint totalSum = 0;
        for (uint i = 0; i < ar.length; i++) {
            totalSum += ar[i];
        }
        return totalSum;
    }

    function logFriends(address[] calldata friends) external pure {
        for (uint i = 0; i < friends.length; i++) {
            console.log(friends[i]);
        }
    }

    function filterEv(uint[] memory arr) external {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenNumbers.push(arr[i]);
            }
        }
    }

    function filterEven(
        uint[] calldata _data
    ) external pure returns (uint[] memory) {
        uint elem;
        for (uint i = 0; i < _data.length; i++) {
            if (_data[i] % 2 == 0) {
                elem++;
            }
        }
        uint[] memory filtered = new uint[](elem);
        uint ind = 0;
        for (uint i = 0; i < _data.length; i++) {
            if (_data[i] % 2 == 0) {
                filtered[ind] = _data[i];
                ind++;
            }
        }
        return filtered;
    }

    constructor() {
        members.push(msg.sender);
    }

    function isMember(address member) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == member) {
                return true;
            }
        }
        return false;
    }

    function removeLastMember() external {
        require(isMember(msg.sender));
        members.pop();
    }

    function addMember(address member) external {
        require(isMember(msg.sender));
        members.push(member);
    }
}
