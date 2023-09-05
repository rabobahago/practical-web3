const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Faucet", function () {
  async function deployContractAndSetVariables() {
    const faucet = await hre.ethers.deployContract("Faucet");
    await faucet.waitForDeployment();
    const [owner] = await ethers.getSigners();
    let withdrawAmount = ethers.utils.parseUnits("1", "ether");
    return { faucet, owner, withdrawAmount };
  }
  it("should deploy and set the owner correctly", async function () {
    const { faucet, owner } = await loadFixture(deployContractAndSetVariables);
    expect(await faucet.owner()).to.equal(owner.address);
  });

  it("should not allow withdrawals above .1 ETH at a time", async function () {
    const { faucet, withdrawAmount } = await loadFixture(
      deployContractAndSetVariables
    );
    await expect(faucet.withdraw(withdrawAmount)).to.be.reverted;
  });
});
