// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");
const owner="";
const rewardsAddress="";
const projectToken=""
const tradedToken=""
async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  const Staking = await hre.ethers.getContractFactory("GrayblockStaking");
  const staking = await Staking.deploy(owner,rewardsAddress,token.address);
  await staking.deployed();
  console.log("Staking contract deployed to:", staking.address);

  const Ido = await hre.ethers.getContractFactory("IDO");
  const ido = await Ido.deploy(projectToken,tradedToken);
  await ido.deployed();
  console.log("IDO contract deployed to:", ido.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
