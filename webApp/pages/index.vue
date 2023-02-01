<template>
    <div class="content">
        <div class="light"></div>
        <h1 class="title">Le token de la fortune</h1>
        <img class="profil" src="https://resize-public.ladmedia.fr/img/var/public/storage/images/news/la-grosse-boulette-de-vincent-lagaf-sur-son-retour-sur-tf1-l-annonce-qu-il-a-du-immediatement-rectifier-1682838/44572832-1-fre-FR/La-grosse-boulette-de-Vincent-Lagaf-sur-son-retour-sur-TF1-l-annonce-qu-il-a-du-immediatement-rectifier-!.jpg"/>
        <!-- <p class="text">{{ res }}</p> -->
    </div>
</template>

<script setup>

let res = ref('');
// fetch hello api
res = await $fetch('/api/hello');

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

.profil {
    width: 3vw;
}

.light {
    border: 1vw yellow solid;
    border-style: dotted;
    height: 96vh;
    width: 98vw;
    position: fixed;
    margin-top: -1vw;
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