const runtimeConfig = useRuntimeConfig()

export default defineEventHandler(async (event) => {

    return {
        statusCode: 200,
        body: JSON.stringify({ message: 'hello' }),
    }

})
