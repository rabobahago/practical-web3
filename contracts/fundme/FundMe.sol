// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint minimumUsd = 50;

    /**
     * Network: Sepolia
     * Data Feed: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    AggregatorV3Interface priceFeed;

    function fund() public payable {
        require(msg.value >= minimumUsd);
    }

    constructor() {
        priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function getPrice() public view returns (uint) {
        (, int price, , , ) = priceFeed.latestRoundData();
        /**
         * ETH to USD 300,00000000 from chainlink price feed
         * @ 1e18 / 1e8 = 1e10
         * Note 1e8 is coming from the price feed
         */
        return uint(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint) {
        uint ethPrice = getPrice();
        uint ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
    // function withdraw(){}
}
