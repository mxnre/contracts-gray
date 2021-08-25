const photoNFT= await PhotoNFT.attach(PHOTO_NFT);
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy

  console.log("deploying contracts");
  const accounts = await ethers.getSigners();
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  const Token2 = await hre.ethers.getContractFactory("Token");
  const token2 = await Token2.deploy();
  await token2.deployed();
  console.log("Token2 deployed to:", token2.address);
  const owner=accounts[0].address;
  const rewardsAddress=token2.address;
  const projectToken=token.address
  const tradedToken=token2.address
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
