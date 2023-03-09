const { ethers } = require("hardhat");

async function main() {
  /**
   Create your contractfactory from you Whitelist contract
   */
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  // Deploy the whitelist contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // Wait for it to finish deploying
  await deployedWhitelistContract.deployed();
  // print the deployed contract address
  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// Call the main function and catch if there are any errors
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
