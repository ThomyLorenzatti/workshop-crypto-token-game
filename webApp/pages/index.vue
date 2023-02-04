<template>
    <div class="content">
        <div class="light"></div>
        <div class="mainContent">
            <h1 class="title">Le token de la fortune</h1>
            <div class="wheelContent">
                <Roulette
                class="wheel"
                ref="wheel"
                :items="items"
                :size="500"
                :result="1"
                :duration="10"
                :indicator-position="top"
                :display-indicator="true"
                :centered-indicator="true"
                :base-display-indicator="true"
                @wheel-start="wheelStartedCallback"
                @wheel-end="wheelEndedCallback"/>
            </div>
            <button class="button" @click="launchWheel">Lancer la roue</button>
            <div class="metaInfos">
                <div v-if="!$metamask.states.installed">
                    <h3>Metamask is not connected</h3>
                    <p>Install Metamask to use this app</p>
                </div>
            <div v-if="$metamask.states.installed">
                <h3>Metamask is already connected</h3>
                <p>Network Chain ID: {{ $metamask.states.chainId }}</p>
                <p v-if="$metamask.states.connected">
                    Wallet: {{ $metamask.states.address }}
                </p>
                <button class="connect" :disabled="$metamask.states.connected" @click="$metamask.connect()">
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/3/36/MetaMask_Fox.svg" alt="Metamask"
                        class="metaLogo">
                    Connect your Wallet
                </button>
                </div>
            </div>
            <img class="profil" src="https://resize-public.ladmedia.fr/img/var/public/storage/images/news/la-grosse-boulette-de-vincent-lagaf-sur-son-retour-sur-tf1-l-annonce-qu-il-a-du-immediatement-rectifier-1682838/44572832-1-fre-FR/La-grosse-boulette-de-Vincent-Lagaf-sur-son-retour-sur-TF1-l-annonce-qu-il-a-du-immediatement-rectifier-!.jpg"/>
        </div>
    </div>
</template>


<script setup>
import { ref } from 'vue'
let res = ref('');
// fetch hello api
res = await $fetch('/api/hello');

const $metamask = useMetamask();
const wheel = ref(null);
const items = [
  { id: 1, name: "Nothing", htmlContent: "Nothing", textColor: "red", background: "black" },
  { id: 2, name: "NFT", htmlContent: "NFT", textColor: "white", background: "blue" },
  { id: 3, name: "Tokens", htmlContent: "Tokens", textColor: "white", background: "green" },
  { id: 4, name: "Mountain of Token", htmlContent: "Mountain of Token", textColor: "white", background: "gold" },
];

function launchWheel (){
    console.log(wheel);
    const audio = new Audio('https://www.gd-productions.info/divers/dossier-tv/justeprix2009_pierrebillon.mp3')
    audio.play()
    wheel.value.launchWheel();
}

function wheelStartedCallback() {
      console.log("wheel started !");
}

function wheelEndedCallback(resultItem) {
    console.log("wheel ended !", resultItem);
}
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