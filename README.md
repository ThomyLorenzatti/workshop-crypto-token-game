# Workshop

## UnderStand BlockChain and create deploy your first Smart-Contract

<p align="center">
  <img style="width: 200px"
  src="https://actualiteinformatique.fr/wp-content/uploads/2020/02/Ether-Smart-Contract.jpg">
</p>

## Prerequisites

- [ ] [Get metamask extension on your browser with a wallet.](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)<br>
- [ ] [Add Mumbai Network (Polygon Testnet) on your Metamask.](https://medium.com/stakingbits/how-to-connect-polygon-mumbai-testnet-to-metamask-fc3487a3871f#:~:text=Connect%20Metamask%20to%20Polygon%20Testnet,the%20Mumbai%20Testnet%20in%20Metamask)<br>
- [ ] [Claim some free matic to deploy contracts on chain.](https://faucet.polygon.technology/) <br>
- [ ] [Node js version 14.17.0 or higher](https://techviewleo.com/how-to-install-node-js-18-lts-on-ubuntu/).

## Setup project, install dependencies

# Global dependencies


```bash
npm install -g truffle
```

# webApp 

```bash
cd webApp
npm install
```

# smartContract

```bash
cd smartContract
npm install
touch .env
```

# 

- [ ] Add private key into your .env as follow : PRIVATE_KEY=<br>
[You can find your private key on metamask extension](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key)<br><br>
- [ ] Add RPC matic network into your .env as follow : RPC_URL=https://matic-mumbai.chainstacklabs.com/

## Lets create our first ERC20 Token

Goal of this workshop is to create a ERC20 Token and deploy it on Polygon (Matic) Mumbai Testnet.
We will use truffle to compile and deploy our smart contract.
Get it touch with the contract file : [smartContract/contracts/MyToken.sol](We will code our smart contract in solidity language).

# 

Our smart contract will use the openzeppelin library to inherit some functions and avoid to code them from scratch.
GameToken is already inheriting the ERC20 contract from openzeppelin library.


## Lets code the smart contract

# Constructor function

(https://docs.openzeppelin.com/contracts/2.x/erc20-supply)

The constructor is the function that is called when the contract is deployed. It is used to initialize the contract state.

- [ ] Create constructor function and pass the name, symbol as constructor parameters.
- [ ] The owner of the contract (adress used to deploy the contract) will be the owner of 1000 GMT tokens.
- [ ] The adress of the contract will be the owner of 100 GMT tokens.
[Mint function](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20#ERC20-_mint-address-uint256-)

# Override the transfer function

The goal of the workshop is to create a token where users on a web app can use 10 GMT to play a game.
The game will be a simple wheel where user pay 10 GMT to spin the wheel and has following caracteristics:
- 10% chance to win 50 GMT
- 20% chance to draw 10 GMT
- 70% chance to loose 10 GMT already paid

To manage to do that we will override the transfer function from ERC20 contract.

- [ ] Override the transfer function, paramets should be an recipient address and an uint256 amount.
- [ ] Raise an InsufficientBalance error if the player doesn't have enough GMT to play.
- [ ] Raise an AmountError error if the player doesn't paid 10 GMT.
- [ ] Transfer 10 GMT to the contract address.

Way to generate a random number between 0 and 100:
```solidity
uint random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;
```

- [ ] Has 10% chance to transfer 50 GMT to the player address and emit a Win event.
- [ ] Has 20% chance to transfer 10 GMT to the player address and emit a Draw event.

# Compile the smart contract and deploy it on Polygon (Matic) Mumbai Testnet

# Compile the smart contract

```bash
truffle compile
```

# Deploy the smart contract

```bash
truffle migrate --network mumbai
```

<p align="center">
  <img style="width: 500px"
  src="https://media.discordapp.net/attachments/801738010139689010/1071792101144137769/Screenshot_2023-02-05_at_14.58.36.png">
</p>

- [ ] You should get the contract adress into the terminal after the deployment.

## Lets interact with our smar contract on the webApp

# Add smart contract adress into the webApp

- [ ] Add the smart contract adress into the smart_contract_address variable in the webApp/nuxt.config.ts file.

# Run the webApp

```bash
cd webApp
npm run dev
```

- [ ] Go to http://localhost:3000/ and connect your metamask wallet to the app.

# Play the game

- [ ] Click on the button "lancer la roue" to play the game.

# Congratulation you just created your first ERC20 Token and deployed it on Polygon (Matic) Mumbai Testnet

Check all transactions of your smart contract on [mumbai polygonscan](https://mumbai.polygonscan.com/).<br>
Paste your smart contract adress into the search bar.

<p align="center">
  <img style="width: 500px"
  src="https://media.discordapp.net/attachments/801738010139689010/1071797729946247249/image.png?width=2160&height=1292">
</p>
