// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/content', '@nuxtjs/google-fonts'],
  content: {
    // ... options
  },
  googleFonts: {
    families: {
      Roboto: true,
      'Noto Sans': true,
      'Noto Sans Thai': true,
    },
  },
  devtools: {
    enabled: true,
    timeline: {
      enabled: true,
    },
  },
})
