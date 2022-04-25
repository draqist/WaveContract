const main = async () => { 
  const [Draq, User] = await hre.ethers.getSigners();
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();
  console.log(`Deployed WavePortal Contract to:  ${waveContract.address}`);
  console.log("------     -----");
  console.log(`Deployed WavePortal Contract by:  ${Draq.address}`);
  
  let waveCount
  waveCount = await waveContract.getTotalWaves();
  console.log("------     -----");
  let waveTxn = await waveContract.wave()
  await waveTxn.wait();

  console.log("------     -----"); 
  
  waveCount = await waveContract.getTotalWaves();
  console.log("------     -----");

  waveTxn = await waveContract.connect(User).wave()
  await waveTxn.wait();
  console.log("------     -----");

  waveCount = await waveContract.getTotalWaves();
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