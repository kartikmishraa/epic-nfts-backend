const main = async () => {
  const contractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftContract = await contractFactory.deploy();
  await nftContract.deployed();

  console.log("Contract deployed with address: ", nftContract.address);

  let txn = await nftContract.makeAnEpicNFT();
  await txn.wait();
  console.log("Minted NTF #1: ", txn.hash);

  txn = await nftContract.makeAnEpicNFT();
  await txn.wait();
  console.log("Minted NFT #2: ", txn.hash);
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
