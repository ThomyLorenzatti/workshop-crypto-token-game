var Web3 = require('web3');
const Provider = require('@truffle/hdwallet-provider');
var fs = require('fs');

var SmartContractAddress = "0x71eF4e71Fe9A77039Fdb69Ac03A6261b66109Fd1";
var SmartContractABI = JSON.parse(fs.readFileSync("../smartContract/build/contracts/GameToken.json"));
var address = "0x4DD57e16B788759565C818299B4197F22d757E18"
var privatekey = "422b8ea0de3313cc2a4df81e24a0aac79ce3d3dc4ae190fc7c4cb69b513ed062";
var rpcurl = "https://matic-mumbai.chainstacklabs.com/";


const main = async () => {

    console.log("in function");
    var provider = new Provider(privatekey, rpcurl);
    var web3 = new Web3(provider);

    var myContract = new web3.eth.Contract(SmartContractABI.abi, SmartContractAddress);

    var tokens = await myContract.methods.balanceOf(address).call();
    console.log("tokens", tokens / 10 ** 18);

    var play = await myContract.methods.play().send({ from: address });
    console.log(play.events.win);

    //   var oldvalue = await myContract.methods.retrieve().call();
    //   console.log("oldvalue", oldvalue);

    //   var receipt = await myContract.methods.store(5781).send({ from: address });
    //   console.log(receipt);

    //   var newvalue = await myContract.methods.retrieve().call();
    //   console.log("newvalue", newvalue);

    //   console.log("done with all things");

}

main();
