// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/content'],
  content: {
    // ... options
  },
  devtools: {
    enabled: true,
    timeline: {
      enabled: true,
    },
  },
})
