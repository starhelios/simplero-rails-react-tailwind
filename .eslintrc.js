module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ['eslint:recommended', 'plugin:react/recommended', 'plugin:prettier/recommended'],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  plugins: ['react'],
  rules: {
    'react-native/no-inline-styles': 0,
    'no-shadow': 'off',
    curly: 'off',
    'handle-callback-err': 'off',
    'react-hooks/exhaustive-deps': 'off',
    'react/prop-types': 'off',
    'prettier/prettier': [
      'error',
      {
        'no-inline-styles': false,
        'no-shadow': false,
        curly: false,
        'handle-callback-err': false,
        'react-hooks/exhaustive-deps': false,
      },
    ],
  },
}
