const dotenv = require('dotenv');
dotenv.config();

const HDWalletProvider = require('@truffle/hdwallet-provider');
const private_key = process.env.PRIVATE_KEY;

module.exports = {
  networks: {
    mumbai: {
      provider: () => new HDWalletProvider(private_key, process.env.RPC_URL),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.13",      // Fetch exact version from solc-bin
    }
  }
};
