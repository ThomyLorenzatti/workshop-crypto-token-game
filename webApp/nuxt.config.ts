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
            smart_contract_address: '0x43f3E6F0a8E580a82Cec4B5710e9C09017F596C1',
            rpc_url: 'https://matic-mumbai.chainstacklabs.com/',
        }
    },
    modules: [
        'nuxt-metamask'
    ]
})
