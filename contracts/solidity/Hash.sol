// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hash {
    //     Properties of Hash
    // A good hash function should have the following properties:
    // One-way: The forward operation from the input message to its hash is simple and uniquely determined, while the reverse is very difficult and can only be enumerated by brute force.
    // Sensitivity: A little change in the input message changes its hash a lot.
    // Efficiency: The operation from the input message to the hash is efficient.
    // Uniformity: The probability of each hash value being taken should be basically equal.
    // Collision resistance:
    // Weak collision resistance: given a message x, it is difficult to find another message x such that hash(x) = hash(x').
    // Strong collision resistance: finding arbitrary x and x such that hash(x) = hash(x') is difficult.
    //     Hash application
    // Unique identifier for generated data
    // Cryptographic signature
    // Secure encryption
    //     Keccak256
    // The Keccak256 function is the most commonly used hash function in solidity, and its usage is very simple:
    // hash = keccak256(data);
    //     Generate unique identifier of the data
    // We can use keccak256 to generate a unique identifier for data. For example we have several different types of data: uint, string, address. We can first use the abi.encodePacked method to pack and encode them, and then use keccak256 to generate a unique identifier.
    // Weak collision resistance
    // We use keccak256 to show the weak collision resistance that given a message x, it is difficult to find another message x' such that hash(x) = hash(x')`.
    // We define a message named 0xAA and try to find another message which's hash value is equal to the message 0xAA.

    // Weak collision resistance
    // function weak(string memory string1) public view returns (bool) {
    //     return keccak256(abi.encodePacked(string1)) == _msg;
    // }

    //     Strong collision resistance
    // We use keccak256 to show the strong collision resistance that finding arbitrarily different x and x' such that hash(x) = hash(x') is difficult.

    // We define a function called strong that receive two parameters of string type named string1 and string2. Then check if their hashed are the same.

    // Strong collision resistance
    function strong(
        string memory string1,
        string memory string2
    ) public pure returns (bool) {
        return
            keccak256(abi.encodePacked(string1)) ==
            keccak256(abi.encodePacked(string2));
    }
}
