require("@nomicfoundation/hardhat-toolbox");

require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */

const Goerli_URL = process.env.Goerli_URL; 
const PRIVATE_KEY = process.env.PRIVATE_KEY; 
module.exports = {
  solidity: "0.8.17",
  networks:{
    goerli:{
      url:Goerli_URL,
      accounts:[PRIVATE_KEY]
    }
  }
};

// 0xB5629272B2530Ed83f8071eec6895F86A3ABab2C