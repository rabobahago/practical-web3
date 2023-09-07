require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: "localhost",
  // networks: {
  //   sepolia: {
  //     url: process.env.ALCHEMY_URL,
  //     accounts: [process.env.TESTNET_PRIVATE_KEY],
  //   },
  //},
};
