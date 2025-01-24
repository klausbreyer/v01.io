const colors = require("tailwindcss/colors");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./layouts/**/*.{html,js}", "./content/**/*.{html,md}"],

  theme: {
    extend: {
      screens: {
        print: {raw: "print"},
      },
      typography: {},
      colors: {},
      fontFamily: {
        // https://tailwindcss.com/docs/font-family#using-a-custom-value
        sharetech: ["Share Tech", "sans-serif"],
      },
    },
  },
};
