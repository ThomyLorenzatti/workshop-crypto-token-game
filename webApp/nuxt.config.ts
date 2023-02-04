// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    css: [
        '@/assets/styles/reset.css',
    ],
    app: {
        pageTransition: { name: 'page', mode: 'out-in' }
    },
    runtimeConfig: {
        public: {
            smart_contract_address: '0x1E9fc0DA26d00F7620297Ef9cf0913a49dAE4288',
            rpc_url: 'https://matic-mumbai.chainstacklabs.com/',
        }
    },
    modules: [
        'nuxt-metamask'
    ]
})
