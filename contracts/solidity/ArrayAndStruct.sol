// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ArrayAndStruct {
    // fixed-length array
    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // variable-length array
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;

    function dynamicArray()
        external
        pure
        returns (uint[] memory, bytes memory)
    {
        // memory dynamic array
        uint[] memory array8 = new uint[](5);
        bytes memory array9 = new bytes(9);
        return (array8, array9);
    }

    //There are four ways to create a struct
    // struct
    struct Student {
        uint256 id;
        uint256 score;
    }

    Student student; // Initially a student structure

    //  assign value to structure
    // Method 1: Create a storage struct reference in the function
    function initStudent1() external {
        Student storage _student = student; // assign a copy of student
        _student.id = 11;
        _student.score = 100;
    }

    // Method 2: Directly refer to the struct of the state variable
    function initStudent2() external {
        student.id = 1;
        student.score = 80;
    }

    // Method 3: struct constructor
    function initStudent3() external {
        student = Student(3, 90);
    }

    // Method 4: key value
    function initStudent4() external {
        student = Student({id: 4, score: 60});
    }
}
