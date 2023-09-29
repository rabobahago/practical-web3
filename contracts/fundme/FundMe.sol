// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint) public addressToAmountFunded;
    address immutable i_owner;

    /**
     * Network: Sepolia
     * Data Feed: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor() {
        i_owner = msg.sender;
    }

    modifier onlyOnwer() {
        require(msg.sender == i_owner, "Sender is not owner");
        _;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "Didn't send enough!"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public payable onlyOnwer {
        for (
            uint funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // payable(msg.sender).transfer(address(this).balance);
        (bool callSuccessful, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccessful, "Call Failed");
    }
}
