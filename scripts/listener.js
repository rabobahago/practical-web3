const provider = new ethers.providers.Web3Provider(window.ethereum);

async function main() {
  const Contract = await hre.ethers.deployContract("EventC");
  const contract = new Contract(erc20TokenAddress, ERC20_ABI, provider);
  contract.on("Transfer", async (from, to, amount, data) => {
    console.log("Transfer event emitted. {from, to, amount, data}");
  });
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
