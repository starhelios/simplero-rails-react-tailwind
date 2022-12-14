const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js,jsx}',
    './app/javascript/*.{js,jsx}',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/views/**/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim}',
    './app/components/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'brand-primary': '#03070E',
        'brand-primary-hover': '#216CEA',
        danger: '#FF0000',
        success: '#00FF00',
        black: '#000',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
