const HDWalletProvider = require('@truffle/hdwallet-provider');
const private_key = '422b8ea0de3313cc2a4df81e24a0aac79ce3d3dc4ae190fc7c4cb69b513ed062';

module.exports = {
  networks: {
    development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 8545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
    },
    matic: {
      provider: () => new HDWalletProvider(private_key, `https://matic-mumbai.chainstacklabs.com/`),
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
