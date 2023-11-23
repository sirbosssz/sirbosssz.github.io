// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: false,
  modules: [
    '@nuxt/content',
    '@nuxtjs/google-fonts',
    '@nuxtjs/tailwindcss',
    '@nuxtjs/color-mode',
    'nuxt-headlessui',
  ],
  content: {
    // ... options
  },
  googleFonts: {
    families: {
      Roboto: true,
      'Noto Sans Thai': true,
    },
  },
  colorMode: {
    classSuffix: '',
  },
  devtools: {
    enabled: true,
    timeline: {
      enabled: true,
    },
  },
})
