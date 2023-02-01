// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    css: [
        '@/assets/styles/reset.css',
    ],
    app: {
        pageTransition: { name: 'page', mode: 'out-in' }
    },
})
