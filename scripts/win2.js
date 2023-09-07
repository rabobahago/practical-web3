const { ethers } = require("hardhat");

const gameAddr = "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9";
const contractName = "Game2";
async function main() {
  const game = await ethers.getContractAt(contractName, gameAddr);
  const tx1 = await game.setX(3);
  tx1.wait();
  const tx2 = await game.setY(5);
  tx2.wait();
  const tx3 = await game.win();
  const receipt = await tx3.wait();
  console.log(receipt);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
