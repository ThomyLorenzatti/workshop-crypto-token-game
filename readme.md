# Workshop

## UnderStand BlockChain and create deploy your first Smart-Contract

<p align="center">
  <img style="width: 200px"
  src="https://actualiteinformatique.fr/wp-content/uploads/2020/02/Ether-Smart-Contract.jpg">
</p>

## Prerequisites

[ ] -  [Get metamask extension on your browser with a wallet.](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)<br>
[ ] - [Add Mumbai Network (Polygon Testnet) on your Metamask.](https://medium.com/stakingbits/how-to-connect-polygon-mumbai-testnet-to-metamask-fc3487a3871f#:~:text=Connect%20Metamask%20to%20Polygon%20Testnet,the%20Mumbai%20Testnet%20in%20Metamask)<br>
[ ] - [Claim some free matic to deploy contracts on chain.](https://faucet.polygon.technology/) <br>
[ ] - [Node js version 14.17.0 or higher](https://techviewleo.com/how-to-install-node-js-18-lts-on-ubuntu/).

## Setup project, install dependencies

# Global dependencies

[ ] - 
```bash
npm install -g truffle
```

# webApp 

[ ] - 
```bash
cd webApp
npm install
```

# smartContract

[ ] - 
```bash
cd smartContract
npm install
touch .env
```

[ ] - Add private key into your .env as follow : PRIVATE_KEY=<br>
[You can find your private key on metamask extension](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key)<br><br>
[ ] - Add RPC matic network into your .env as follow : RPC_URL=https://matic-mumbai.chainstacklabs.com/
