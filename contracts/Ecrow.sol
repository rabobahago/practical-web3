// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Escrow {
    //paying for the service
    address public depositor;
    //mediator: that is escrow smart contract address
    address public arbiter;
    //giving the service
    address public beneficiary;

    bool public isApproved = false;

    //emit event when the transfer of fund has been done
    event Approved(uint256 _balance);

    constructor(address _address1, address _address2) payable {
        //the depositor must be the one deploying the contract
        depositor = msg.sender;
        //the two other address must be in their order
        arbiter = _address1;
        beneficiary = _address2;
    }

    function approve() external {
        //note the only person that can call approved function is arbiter address
        require(msg.sender == arbiter);
        //save this contract balance in a local variable
        uint balance = address(this).balance;
        //transfer fund to beneficiary
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success);
        //change the state bool variable isApproved to true;
        isApproved = true;
        //emit the approved event
        emit Approved(balance);
    }
}
