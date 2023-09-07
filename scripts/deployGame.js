// replace the name of the contract with which one you want to deploy!
const contractName = "Game2";

async function main() {
  const game = await hre.ethers.deployContract(contractName);
  // if you need to add constructor arguments for the particular game, add them here:
  await game.waitForDeployment();
  console.log(`${contractName} deployed to address: ${game.target}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
