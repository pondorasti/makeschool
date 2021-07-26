const plugin = require("tailwindcss/plugin")

module.exports = {
  mode: "jit",
  purge: ["./src/**/*.{js,ts,jsx,tsx}"],
  darkMode: "media",
  corePlugins: {
    preflight: false,
  },
  plugins: [
    // tailwindcss
    plugin(function ({ addUtilities }) {
      addUtilities({
        ".h-navbar": {
          height: "69px",
        },
        ".top-navbar": {
          top: "69px",
        },
        ".navbar-link": {
          "@apply text-sm font-medium text-black opacity-70 hover:opacity-100": {},
        },
        ".bg-blur": {
          "@apply bg-opacity-50 bg-gray-50 dark:bg-opacity-50 backdrop-filter backdrop-blur": {},
        },
        ".px-body": {
          "@apply px-4 sm:px-6 xl:px-8": {},
        },
        ".html-body": {
          "@apply max-w-7xl mx-auto": {}, // bg-gray-50 removed
        },
      })
    }),
  ],
}
