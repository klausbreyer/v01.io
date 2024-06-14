const colors = require("tailwindcss/colors");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./layouts/**/*.{html,js}", "./content/**/*.{html,md}"],

  plugins: [require("@tailwindcss/forms"), require("@tailwindcss/typography")],
  theme: {
    extend: {
      screens: {
        print: {raw: "print"},
      },
      typography: {},
      colors: {
        primary: colors.rose[600],
        dark: colors.rose[900],
        footer: "#252526",
        footer2: "#3d3e3d",
        bg: "#1e1e1e",
        text: "#d4d4d4",
      },
      fontFamily: {
        sharetech: ["Share Tech", "sans-serif"],
      },
    },
  },
};
