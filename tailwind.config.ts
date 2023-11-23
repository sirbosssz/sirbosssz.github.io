import type { Config } from 'tailwindcss'

export default <Partial<Config>>{
  darkMode: 'class',
  theme: {
    extend: {},
  },
  content: [],
  plugins: [require('@headlessui/tailwindcss')({ prefix: 'ui' })],
}
