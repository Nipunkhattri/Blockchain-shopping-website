async function main() {
  const ShoppingContract = await ethers.getContractFactory("ShoppingContract");
  const shoppingContract = await ShoppingContract.deploy();

  console.log("ShoppingContract deployed to:", shoppingContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
