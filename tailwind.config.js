const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
      './app/views/**/*',
      './node_modules/flowbite/**/*.js'
    ],
    theme: {
      screens: {
        sm: '480px',
        md: '768px',
        lg: '976px',
        xl: '1440px',
      },
      extend: {
        spacing: {
          '128': '32rem',
          '144': '36rem',
        },
        fontFamily: {
            sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            sans: ['Roboto', 'Arial', 'sans-serif']
      },
    },
    plugins: [
        require('flowbite/plugin')
    ],
  }
}