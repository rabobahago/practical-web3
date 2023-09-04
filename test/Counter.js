const { assert } = require("chai");

describe("Counter", function () {
  it("x value is zero", async function () {
    const contract = await hre.ethers.deployContract("Counter");
    await contract.waitForDeployment();
    const val = await contract.get();
    assert.equal(val, 0);
  });
  it("x value is one", async function () {
    const contract = await hre.ethers.deployContract("Counter");
    await contract.waitForDeployment();
    await contract.inc();
    await contract.inc();
    const val = await contract.get();
    assert.notEqual(val, 1);
  });
  it("x value is negative one", async function () {
    const contract = await hre.ethers.deployContract("Counter");
    await contract.waitForDeployment();
    await contract.dec();
    const val = await contract.get();
    assert.equal(val, -1);
  });
});
