<template>
    <div class="content">
        <div class="light"></div>
        <div class="mainContent">
            <h1 class="title">Le token de la fortune</h1>
            <div class="wheelContent">
                <Roulette
                class="wheel"
                ref="wheel"
                :key="update"
                :items="items"
                :size="500"
                :result="1"
                :duration="10"
                :display-indicator="true"
                :centered-indicator="true"
                :base-display-indicator="true"
                :wheel-result-index="{ value: result }"
                @wheel-start="wheelStartedCallback"
                @wheel-end="wheelEndedCallback"/>
            </div>
            <button class="button" @click="launchWheel">Lancer la roue</button>
            <div class="metaInfos">
                <div v-if="!$metamask.states.connected">
                    <h3>Metamask is not connected</h3>
                    <p>Install Metamask to use this app</p>
                    <button class="connect" @click="$metamask.connect()">
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/3/36/MetaMask_Fox.svg" alt="Metamask"
                        class="metaLogo">
                        Connect your Wallet
                    </button>
                </div>
                <div class="textFont" v-if="$metamask.states.connected">
                    <h3>Metamask is connected</h3>
                    <p class="p-tag">Wallet: {{ $metamask.states.address }}</p>
                    <p class="p-tag">Network Chain ID: {{ $metamask.states.chainId }}</p>
                    <p class="p-tag">Mes GameTokens: {{ userBalance }}</p>
                    <p class="p-tag">CasinoTokens: {{ contractBalance }}</p>
                </div>
            </div>
            <img class="profil" src="https://resize-public.ladmedia.fr/img/var/public/storage/images/news/la-grosse-boulette-de-vincent-lagaf-sur-son-retour-sur-tf1-l-annonce-qu-il-a-du-immediatement-rectifier-1682838/44572832-1-fre-FR/La-grosse-boulette-de-Vincent-Lagaf-sur-son-retour-sur-TF1-l-annonce-qu-il-a-du-immediatement-rectifier-!.jpg"/>
        </div>
    </div>
</template>


<script setup>
import { ref } from 'vue'
import SmartContract from '../../smartContract/build/contracts/GameToken.json'
import web3 from 'web3';

const abi = SmartContract.abi;

let contractBalance = ref(0);
let userBalance = ref(0);

let metamask = undefined;
let contract = undefined;
let myAdress = undefined;

const config = useRuntimeConfig()
const wheel = ref(null);
const items = [
  { id: 1, name: "Nothing", htmlContent: "Nothing", textColor: "red", background: "black" },
  { id: 2, name: "10 GMT", htmlContent: "10 GMT", textColor: "white", background: "blue" },
  { id: 3, name: "Nothing", htmlContent: "Nothing", textColor: "red", background: "black" },
  { id: 4, name: "50 GMT", htmlContent: "50 GMT", textColor: "white", background: "green" },
];

let result = 2;

const update = ref(0);

const forceRerender = () => {
  update.value += 1;
};

async function launchWheel () {

    let transaction = undefined;
    try {
        transaction = await contract.methods.transfer(config.smart_contract_address, (10*10**18).toString()).send({from: myAdress});
    } catch (error) {
        alert('error during buying wheel spin');
        console.log(error);
        return;
    }

    updateBalances();
    const events = transaction.events;

    const audio = new Audio('https://www.gd-productions.info/divers/dossier-tv/justeprix2009_pierrebillon.mp3')
    audio.play()

    result = 2;
    // check if event win is emitted
    if (events.win !== undefined) {
        console.log("player win 50 GMT !");
        result = 3;
    }
    if (events.draw !== undefined) {
        console.log("player win 10 GMT back !");
        result = 1;
    }
    forceRerender();
    await new Promise(resolve => setTimeout(resolve, 100));
    console.log(result);
    wheel.value.launchWheel();
}

function wheelStartedCallback() {
      console.log("wheel started !");
}

function wheelEndedCallback(resultItem) {
    console.log("wheel ended !");
}

async function updateBalances() {
    metamask = new web3(window.ethereum);
    contract = new metamask.eth.Contract(abi, config.smart_contract_address);

    myAdress = await metamask.eth.getAccounts();
    myAdress = myAdress[0];

    userBalance.value = await contract.methods.balanceOf(myAdress).call() / 10**18;
    contractBalance.value = await contract.methods.balanceOf(config.smart_contract_address).call() / 10**18;
}

onMounted (() => {

    // check if metamask is installed
    if (typeof window.ethereum !== 'undefined') {
        console.log('MetaMask is installed!');

        updateBalances();

    } else {
        alert('MetaMask is not installed!');
    };

})

</script>

<script>
import { Roulette } from 'vue3-roulette'

export default {
  components: {
    Roulette,
  },
};
</script>

<style scoped>
.content {
    display: flex;
    justify-content: center;
    color: white;

    height: 96vh;
    background-color: lightblue;
    border: 1vw blue solid;
}

.metaInfos {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: fixed;
    top: 1.5vw;
    left: 1.5vw;
    border-radius: 15px;
    padding: 15px;
    background-color: blue;
}

.connect {
    background-color: white;
    color: blue;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 900;
    font-size: larger;
    border-radius: 15px;
    padding: 10px;
    margin-top: 0.5vw;
    display: flex;
    align-items: center;
    justify-content: center;
}

.metaLogo {
    height: 1vw;
    width: 1vw;
    margin-right: 0.5vw;
}

.button {
    background-color: blue;
    color: white;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 900;
    font-size: larger;
    border: 1vw blue solid;
    border-radius: 15px;
    margin-top: 2vw;
}

.mainContent {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100%;
    width: 100%;
}

.wheel {
    margin-top: 5vw;
    font-family: Arial, Helvetica, sans-serif;
    font-size: larger;
    font-weight: 900;
    /* border: 1vw blue solid; */
}

.profil {
    object-fit: cover;
    align-self: flex-end;
    padding: 20px;
    border-radius: 50%;
    height: 8vw;
    width: 8VW;
}

.light {
    border: 1vw yellow solid;
    border-style: dotted;
    height: 96vh;
    width: 98vw;
    position: fixed;
    margin-top: -1vw;
    pointer-events: none; 
}

.text {
    font-family: Arial, Helvetica, sans-serif;
    color: blue;
    font-weight: 900;
}

.p-tag {
    padding: 3px;
}

.textFont {
    font-family: Arial, Helvetica, sans-serif;
    color: white;
    font-weight: 600;
}

.title {
    font-family: Arial, Helvetica, sans-serif;
    color: white;
    font-weight: 900;
    font-size: larger;
    text-transform: uppercase;
    background-color: blue;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
    height: 1vw;
    padding: 10px;
}
</style>