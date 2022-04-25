const main = async () => { 
  const [deployer] = await hre.ethers.getSigners();
  const currentBalance = await deployer.getBalance();
  
  console.log(`Deployer contract address: ${deployer.address}`);
  console.log('------     -----');
  console.log("Account Balance: " + currentBalance.toString());

  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();

  console.log(`Deployed WavePortal Contract to:  ${waveContract.address}`);
}

const runMain = async () => {
  try {
    await main();
    process.exit(0)
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

runMain()