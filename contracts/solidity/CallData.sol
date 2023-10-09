// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CallData {
    //     The first 4 bytes of calldata is called a function selector. In this section, we will introduce what selector is and how to use it.
    // msg.data
    // msg.data is a global variable in solidity. The value of msg.data is the full calldata (the data passed in when the function is called).
    // In the following code, we can output the calldata that calls the mint function through the Log event:

    // event returns msg.data
    event Log(bytes data);

    function mint(address _to) external {
        emit Log(msg.data);
    }

    // When the parameter is 0x2c44b726ADF1963cA47Af88B284C06f30380fC78, the output calldata is
    // 0x6a6278420000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78

    //     The first 4 bytes are the selector:
    // 0x6a627842

    // The next 32 bytes are the input parameters:
    // 0x0000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78

    //     method id、selector and Function Signatures
    // The method id is defined as the first 4 bytes after the Keccak hash of the function signature. The function is called when the selector matches the method id.

    // Then what is the function signature ? In section 21, we introduced function signature. The function signature is "function_name(comma-separated parameter types)". For example, the function signature of mint in the code above is "mint(address)". In the same smart contract, different functions have different function signatures, so we can determine which function to call by the function signature.

    // Please note that uint and int are written as uint256 and int256 in the function signature.

    // Let's define a function to verify that the method id of the mint function is 0x6a627842. You can call the function below and see the result.

    function mintSelector() external pure returns (bytes4 mSelector) {
        return bytes4(keccak256("mint(address)"));
    }

    //     how to use selector
    // We can use selector to call the target function. For example, if I want to call the mint function, I just need to use abi.encodeWithSelector to pack and encode the mint function's method id as the selector and parameters, and pass it to the call function:

    function callWithSignature() external returns (bool, bytes memory) {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(
                0x6a627842,
                "0x2c44b726ADF1963cA47Af88B284C06f30380fC78"
            )
        );
        return (success, data);
    }
}
