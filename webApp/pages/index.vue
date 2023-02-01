<template>
    <div class="content">
        <div class="light"></div>
        <div class="mainContent">
            <h1 class="title">Le token de la fortune</h1>
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
            <button class="button" @click="launchWheel">Lancer la roue</button>
            <img class="profil" src="https://resize-public.ladmedia.fr/img/var/public/storage/images/news/la-grosse-boulette-de-vincent-lagaf-sur-son-retour-sur-tf1-l-annonce-qu-il-a-du-immediatement-rectifier-1682838/44572832-1-fre-FR/La-grosse-boulette-de-Vincent-Lagaf-sur-son-retour-sur-TF1-l-annonce-qu-il-a-du-immediatement-rectifier-!.jpg"/>
        </div>
        <!-- <p class="text">{{ res }}</p> -->
    </div>
</template>


<script setup>
import { ref } from 'vue'
let res = ref('');
// fetch hello api
res = await $fetch('/api/hello');

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

.button {
    background-color: blue;
    color: white;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 900;
    font-size: larger;
    border: 1vw blue solid;
    border-radius: 15px;
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
    height: 15%;
    width: 140px;
    align-self: flex-end;
    padding: 20px;
    border-radius: 50%;
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