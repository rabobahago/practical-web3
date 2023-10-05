// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DataStorage {
    function fCalldata(
        uint[] calldata _x
    ) public pure returns (uint[] calldata) {
        //The parameter is the calldata array, which cannot be modified.
        // _x[0] = 0 //This modification will report an error.
        return (_x);
    }

    uint[] x = [1, 2, 3]; // state variable: array x

    function fStorage() public {
        //Declare a storage variable xStorage, pointing to x. Modifying xStorage will also affect x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    function fMemory() public view {
        //Declare a variable xMemory of Memory, copy x. Modifying xMemory will not affect x
        uint[] memory xMemory = x;
        xMemory[0] = 100;
    }

    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }
}
