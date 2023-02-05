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
            smart_contract_address: '0x8bFD36837BbF6FD203Da12F1884eC8CC701fF042',
            rpc_url: 'https://matic-mumbai.chainstacklabs.com/',
        }
    },
    modules: [
        'nuxt-metamask'
    ]
})
