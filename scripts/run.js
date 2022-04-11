const main = async () => {
  const contractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftContract = await contractFactory.deploy();
  await nftContract.deployed();

  console.log("contract address: ", nftContract.address);

  let txn = await nftContract.makeAnEpicNFT();
  await txn.wait();

  txn = await nftContract.makeAnEpicNFT();
  await txn.wait();
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
